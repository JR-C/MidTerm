import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMap extends StatefulWidget {
  GMap({Key key}) : super(key: key);

  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        backgroundColor: Colors.teal[900],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(28.5966, -81.3013),
          zoom: 12,
        ),
      ),
    );
  }
}
