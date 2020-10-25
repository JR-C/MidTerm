import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Stack(),
      ),
      color: Color.fromRGBO(8, 25, 35, 1),
    );
  }
}
