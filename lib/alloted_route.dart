import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AllotedRoute extends StatefulWidget {
  const AllotedRoute({super.key});

  @override
  State<AllotedRoute> createState() => _AllotedRouteState();
}

class _AllotedRouteState extends State<AllotedRoute> {
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

  @override
  void initState() {
    super.initState();
    _addMarkers();
    _getPolyline();
  }

  _addMarkers() {
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
          width: 4,
        ),
      );
    });
  }

  Future<List<LatLng>> _getRouteCoordinates(List<LatLng> waypoints) async {
    List<LatLng> coordinates = [];
    for (int i = 0; i < waypoints.length - 1; i++) {
      String apiUrl =
          "https://maps.googleapis.com/maps/api/directions/json?origin=${waypoints[i].latitude},${waypoints[i].longitude}&destination=${waypoints[i + 1].latitude},${waypoints[i + 1].longitude}&key=AIzaSyBDTkHYkCgeRGXkT-4PXBG_H_rN2wZunCk";

      final response = await http.get(Uri.parse(apiUrl));
      Map values = jsonDecode(response.body);
      List<dynamic> routes = values["routes"];
      List<dynamic> legs = routes[0]["legs"];
      for (int j = 0; j < legs.length; j++) {
        List<dynamic> steps = legs[j]["steps"];
        for (int k = 0; k < steps.length; k++) {
          String polyline = steps[k]["polyline"]["points"];
          List<LatLng> singleLineCoordinates = _decodePoly(polyline);
          for (int l = 0; l < singleLineCoordinates.length; l++) {
            coordinates.add(singleLineCoordinates[l]);
          }
        }
      }
    }
    return coordinates;
  }

  List<LatLng> _decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = <double>[];
    int index = 0;
    int len = poly.length;
    int c = 0;
    // repeating until all attributes are decoded
    do {
      var shift = 0;
      int result = 0;

      // for decoding value of one attribute
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      // if value is negative then bitwise not the value
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      // adding result to list
      lList.add(result1);
    } while (index < len);

    //adding to previous value as done in encoding
    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    print(lList.toString());

    var data = <LatLng>[];
    //points to LatLng is decoded here
    for (var i = 0; i < lList.length; i++) {
      if (i % 2 != 0) {
        data.add(new LatLng(lList[i - 1], lList[i]));
      }
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Vaahika',
          style: TextStyle(
            fontFamily: 'LakkiReddy',
            fontSize: 36,
          ),
        ),
      ),
      body: Container(
        child: SafeArea(
          child: GoogleMap(
            initialCameraPosition: _kGoogle,
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
      ),
    );
  }
}
