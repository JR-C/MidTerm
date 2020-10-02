import 'dart:collection';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class OpenWeather extends StatefulWidget {
  @override
  _OpenWeatherState createState() => _OpenWeatherState();
}

class _OpenWeatherState extends State<OpenWeather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.height,
            color: Colors.teal[900],
          ),
        ],
      ),
    );
  }
}
