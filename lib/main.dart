import 'package:flutter/material.dart';

//Starting point of app
void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.greenAccent[200],
          appBar: AppBar(
            title: Text('All In Map'),
            backgroundColor: Colors.green[900],
          ),
          body: Center(
            child: Image(
              image: NetworkImage(
                  'https://www.rodenstock.com/mediadownload/_images/_live_b2c/medias/0000/00/1d/58/1923327/Rodenstock-Auto-0001-1360x680px-020-min.jpg'),
            ),
          ),
        ),
      ),
    );
