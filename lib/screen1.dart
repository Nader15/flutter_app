import 'package:flutter/material.dart';

class SuccessReg extends StatefulWidget {
  @override
  _SuccessRegState createState() => _SuccessRegState();
}

class _SuccessRegState extends State<SuccessReg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("SUCCESS REGISTRATION",style: TextStyle(fontSize: 20),),
      ),
    );
  }
}
