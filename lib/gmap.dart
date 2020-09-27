import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMap extends StatefulWidget {
  GMap({Key key}) : super(key: key);

  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  Set<Marker> _markers = HashSet<Marker>();
  GoogleMapController _mapController;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('0'),
          position: LatLng(28.5966, -81.3013),
          infoWindow: InfoWindow(
            title: 'Full Sail University',
            snippet: 'School of learning',
          ),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('1'),
          position: LatLng(28.3852, -81.5639),
          infoWindow: InfoWindow(
            title: 'Disney World Resort',
            snippet: 'Place of Magic',
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Map'),
          backgroundColor: Colors.teal[900],
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(28.5966, -81.3013),
                zoom: 12,
              ),
              markers: _markers,
              myLocationEnabled: true,
            ),
          ],
        ));
  }
}
