import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "短信",
        style: TextStyle(
            color: Colors.black, fontSize: 26.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
