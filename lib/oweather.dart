import 'dart:collection';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OpenWeather extends StatefulWidget {
  @override
  _OpenWeatherState createState() => _OpenWeatherState();
}

class _OpenWeatherState extends State<OpenWeather> {
  int temperature = 0;
  String location = 'Orlando';
  int woeid = 2466256;

  String searchApiUrl =
      'https://www.metaweather.com/api/location/search/?query=';
  String 

  void fetchSearch(String search) async {
    var searchResult = await http.get(searchApiUrl + search);
    var result = json.decode(searchResult.body)[0];

    setState(() {
      location = result['title'];
      woeid = result['woeid'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'images/clear.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Center(
                  child: Text(
                    temperature.toString() + '\u2109',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(color: Colors.white, fontSize: 40.0),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    width: 300,
                    child: TextField(
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      decoration: InputDecoration(
                          hintText: 'Search Location...',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
