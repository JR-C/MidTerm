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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/clear.png'),
        ),
      ),
    );
  }
}
