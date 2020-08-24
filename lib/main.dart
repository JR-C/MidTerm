import 'package:flutter/material.dart';

//Starting point of app
void main() => runApp(AllInMap());

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
                    child: Container(
                      color: Colors.teal[900],
                      width: 125.0,
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
                  Expanded(
                    child: Container(
                      color: Colors.teal[900],
                      width: 125.0,
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
                  Expanded(
                    child: Container(
                      color: Colors.teal[900],
                      width: 125.0,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
