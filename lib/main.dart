import 'package:allinmap/gmap.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//Starting point of app
void main() => runApp(AllInMap());

class MapsDemo extends StatefulWidget {
  MapsDemo() : super();
  @override
  _MapsDemoState createState() => _MapsDemoState();
}

class _MapsDemoState extends State<MapsDemo> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(28.5966, 81.3013);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId(_lastMapPosition.toString()),
            position: _lastMapPosition,
            infoWindow: InfoWindow(
              title: 'Title',
              snippet: 'Snip',
            )),
      );
    });
  }

  Widget button(Function function, IconData icon) {
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.teal[900],
      child: Icon(
        icon,
        size: 36.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('All In Map'),
          backgroundColor: Colors.teal[900],
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget>[
                    button(_onMapTypeButtonPressed, Icons.map),
                    SizedBox(
                      height: 16.0,
                    ),
                    button(_onAddMarkerButtonPressed, Icons.add_location),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AllInMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('All In Map'),
          backgroundColor: Colors.teal[900],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GMap(),
                          ),
                        );
                        print("pressed");
                        MapsDemo();
                      },
                      padding: EdgeInsets.all(1.0),
                      child: Container(
                        color: Colors.teal[900],
                        width: 135.0,
                        height: 60.0,
                        child: Center(
                          child: Text(
                            'Map',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        print('Clicked Weather Tab');
                      },
                      padding: EdgeInsets.all(1.0),
                      child: Container(
                        color: Colors.teal[900],
                        width: 135.0,
                        height: 60.0,
                        child: Center(
                          child: Text(
                            'Weather',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        print('Clicked Time Tab');
                      },
                      padding: EdgeInsets.all(1.0),
                      child: Container(
                        color: Colors.teal[900],
                        width: 135.0,
                        height: 60.0,
                        child: Center(
                          child: Text(
                            'Time',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
