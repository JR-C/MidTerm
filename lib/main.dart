import 'package:flutter/material.dart';

//Starting point of app
void main() => runApp(AllInMap());

class AllInMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[500],
        appBar: AppBar(
          title: Text('All In Map'),
          backgroundColor: Colors.green[900],
        ),
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                height: double.infinity,
              ),
              Container(
                color: Colors.green[900],
                width: 100.0,
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
              Container(
                color: Colors.green[900],
                width: 100.0,
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
              Container(
                color: Colors.green[900],
                width: 100.0,
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
              Container(
                height: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
