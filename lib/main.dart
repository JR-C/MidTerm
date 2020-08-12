import 'package:flutter/material.dart';

//Starting point of app
void main() => runApp(AllInMap());

class AllInMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.greenAccent[200],
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
                color: Colors.green[500],
                width: 100.0,
                height: 100.0,
                child: Text('Map'),
              ),
              Container(
                color: Colors.green[500],
                width: 100.0,
                height: 100.0,
                child: Text('Weather'),
              ),
              Container(
                color: Colors.green[500],
                width: 100.0,
                height: 100.0,
                child: Text('Time'),
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
