import 'package:flutter/material.dart';

void CustomSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String content) {
  scaffoldKey.currentState.showSnackBar(SnackBar(
    backgroundColor: Colors.white,
    duration: Duration(seconds: 3),
    elevation: 6.0,
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        Icon(Icons.insert_emoticon, color: Colors.black),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Text(
            "${content.toString()}",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    ),
  ));
}
