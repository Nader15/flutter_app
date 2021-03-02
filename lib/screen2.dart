import 'package:flutter/material.dart';

class FailedReg extends StatefulWidget {
  @override
  _FailedRegState createState() => _FailedRegState();
}

class _FailedRegState extends State<FailedReg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("FAILED REGISTRATION",style: TextStyle(fontSize: 20),),
      ),
    );
  }
}
