//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class OpenWeather extends StatefulWidget {
  @override
  _OpenWeatherState createState() => _OpenWeatherState();
}

class _OpenWeatherState extends State<OpenWeather> {
  int temperature;
  var minTempForecast = new List(7);
  var maxTempForecast = new List(7);

  String location = 'Miami';
  int woeid = 2450022;
  String weather = 'clear';
  String abbrev = '';
  var abbrevForecast = new List(7);
  String errorMessage = '';

  String searchApiUrl =
      'https://www.metaweather.com/api/location/search/?query=';
  String locationApiUrl = 'https://www.metaweather.com/api/location/';

  initState() {
    super.initState();
    fetchLocation();
    fetchLocationDay();
  }

  void fetchSearch(String input) async {
    try {
      var searchResult = await http.get(searchApiUrl + input);
      var result = json.decode(searchResult.body)[0];

      setState(() {
        location = result["title"];
        woeid = result["woeid"];
        errorMessage = '';
      });
    } catch (error) {
      setState(() {
        errorMessage = "Sorry, no data available. Try Another Location";
      });
    }
  }

  void fetchLocation() async {
    var locationResult = await http.get(locationApiUrl + woeid.toString());
    var result = json.decode(locationResult.body);
    var consolidatedWeather = result["consolidated_weather"];
    var data = consolidatedWeather[0];

    setState(() {
      temperature = data["the_temp"].round();
      weather = data["weather_state_name"].replaceAll(' ', '').toLowerCase();
      abbrev = data["weather_state_abbr"];
    });
  }

  void fetchLocationDay() async {
    var today = new DateTime.now();
    for (var i = 0; i < 7; i++) {
      var locationDayResult = await http.get(locationApiUrl +
          woeid.toString() +
          '/' +
          new DateFormat('y/M/d')
              .format(today.add(new Duration(days: i + 1)))
              .toString());
      var result = json.decode(locationDayResult.body);
      var data = result[0];

      setState(() {
        minTempForecast = data["min_temp"].round();
        maxTempForecast = data["max_temp"].round();
        abbrevForecast = data["weather_state_abbr"];
      });
    }
  }

  void onTextFieldSubmitted(String input) async {
    await fetchSearch(input);
    await fetchLocation();
    await fetchLocationDay();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/$weather.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: temperature == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Center(
                            child: Image.network(
                          'https://www.metaweather.com/static/img/weather/png/' +
                              abbrev +
                              '.png',
                          width: 100,
                        )),
                        Center(
                          child: Text(
                            (temperature * 9 / 5 + 32).round().toString() +
                                '\u2109',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50.0,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            location,
                            style:
                                TextStyle(color: Colors.white, fontSize: 40.0),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        forecastElement(1),
                        forecastElement(2),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 300,
                          child: TextField(
                            onSubmitted: (String input) {
                              onTextFieldSubmitted(input);
                            },
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
                              ),
                            ),
                          ),
                        ),
                        Text(
                          errorMessage,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 15.0,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

Widget forecastElement(daysFromNow) {
  var now = new DateTime.now();
  var dayFromNow = now.add(new Duration(days: daysFromNow));
  return Container(
    decoration: BoxDecoration(
      color: Color.fromRGBO(205, 212, 228, 0.2),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: <Widget>[
        Text(
          new DateFormat.E().format(dayFromNow),
          style: TextStyle(color: Colors.white, fontSize: 25),
        )
      ],
    ),
  );
}
