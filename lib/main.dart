import 'package:allinmap/gmap.dart';
import 'package:allinmap/oweather.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

//Starting point of app
void main() => runApp(AllInMap());

class AllInMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All In Map',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('All In Map'),
          backgroundColor: Colors.teal[900],
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Image(
                image: AssetImage('images/map.jpg'),
                height: 540,
                fit: BoxFit.cover,
              ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OpenWeather(),
                          ),
                        );
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
