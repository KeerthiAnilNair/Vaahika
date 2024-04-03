// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_declarations

import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckRoute extends StatefulWidget {
  const CheckRoute({Key? key}) : super(key: key);

  @override
  State<CheckRoute> createState() => _CheckRouteState();
}

class _CheckRouteState extends State<CheckRoute> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(8.5458, 76.9063),
    zoom: 14,
  );

  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  List<LatLng> latLen = [
    LatLng(8.5458, 76.9063),
    LatLng(8.5539, 76.9153),
    LatLng(8.5206, 76.942),
    LatLng(8.5027, 76.9485),
    LatLng(8.4887, 76.9521),
    LatLng(8.5458, 76.9063),
  ];
  LocationData? currentLocation;
  void getCurrentLocation() {
    Location location = Location();
    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );
    location.onLocationChanged.listen(
      (newLoc) {
        currentLocation = newLoc;
        setState(() {});
      },
    );
  }

  late PolylinePoints polylinePoints;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    polylinePoints = PolylinePoints();
    _addMarkers();
    _getPolyline();
  }

  _addMarkers() {
    if (currentLocation != null) {
      _markers.add(
        Marker(
          markerId: MarkerId("current"),
          position: LatLng(
            currentLocation!.latitude ?? 0.0,
            currentLocation!.longitude ?? 0.0,
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    }
    for (int i = 0; i < latLen.length; i++) {
      _markers.add(
        Marker(
          markerId: MarkerId(i.toString()),
          position: latLen[i],
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    }
  }

  _getPolyline() async {
    List<LatLng> routeCoords = await _getRouteCoordinates(latLen);

    setState(() {
      _polyline.add(
        Polyline(
          polylineId: PolylineId('route'),
          points: routeCoords,
          color: Colors.red,
          width: 3,
        ),
      );
    });
  }

  Future<List<LatLng>> _getRouteCoordinates(List<LatLng> waypoints) async {
    List<LatLng> coordinates = [];
    for (int i = 0; i < waypoints.length - 1; i++) {
      PointLatLng start =
          PointLatLng(waypoints[i].latitude, waypoints[i].longitude);
      PointLatLng end =
          PointLatLng(waypoints[i + 1].latitude, waypoints[i + 1].longitude);

      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyAuiWTfi_rBxesAjlsZ_aoqgRpbRfLmlAQ', // Replace with your API key
        start,
        end,
      );
      List<LatLng> routeCoords = _decodePoly(result.points);
      coordinates.addAll(routeCoords);
    }
    return coordinates;
  }

  List<LatLng> _decodePoly(List<PointLatLng> polylinePoints) {
    List<LatLng> coordinates = [];
    for (var point in polylinePoints) {
      coordinates.add(LatLng(point.latitude, point.longitude));
    }
    return coordinates;
  }

  void _launchMaps() async {
    if (Platform.isAndroid) {
      Uri googleUrl = Uri.parse(
          'https://www.google.com/maps/dir/?api=1&origin=${currentLocation!.latitude},${currentLocation!.longitude}&destination=${latLen.last.latitude},${latLen.last.longitude}&waypoints=${latLen.sublist(0, latLen.length - 1).map((e) => "${e.latitude},${e.longitude}").join("%7C")}');
      if (await canLaunchUrl(googleUrl)) {
        await launchUrl(googleUrl);
      } else {
        throw 'Could not launch $googleUrl';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Vaahika',
          style: TextStyle(fontFamily: 'LakkiReddy', fontSize: 36),
        ),
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: currentLocation != null
              ? CameraPosition(
                  target: LatLng(
                    currentLocation!.latitude ?? 0.0,
                    currentLocation!.longitude ?? 0.0,
                  ),
                )
              : _kGoogle,
          mapType: MapType.normal,
          markers: _markers,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          compassEnabled: true,
          polylines: _polyline,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchMaps();
        },
        child: Icon(Icons.directions),
      ),
    );
  }
}
