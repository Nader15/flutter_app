import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/API.dart';
import 'package:flutter_app/custom_snackBar.dart';
import 'package:flutter_app/login_model.dart';
import 'package:flutter_app/screen1.dart';
import 'package:flutter_app/screen2.dart';

class RegScreen extends StatefulWidget {
  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  UserLogin userLogin;
  bool _autoValidate = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> scafoldState = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafoldState,
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          autovalidate: _autoValidate,
          child: Builder(
            builder: (context) => Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validateUsername,
                  controller: usernameController,
                  decoration: InputDecoration(hintText: "Enter your username"),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validatePassword,
                  controller: passwordController,
                  decoration: InputDecoration(hintText: "Enter your Password"),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      onPressed: () {
                        _validateInputs();
                        if (formKey.currentState.validate()) {
                          Api(context)
                              .userLogin(scafoldState, usernameController.text,
                                  passwordController.text)
                              .then((value) {
                            if (value is UserLogin) {
                              userLogin = value;
                              Future.delayed(Duration(seconds: 3), () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SuccessReg()));
                                // navigateAndKeepStack(context,Competitions());
                              });
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FailedReg()));
                            }
                          });
                        } else {
                          CustomSnackBar(scafoldState, "Error");
                        }
                      },
                      child: Text("Register"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateInputs() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  String validatePassword(String value) {
    if (value.length == 0)
      return 'You must enter your Password';
    else if (value.length < 5)
      return 'Enter your Correct Password';
    else
      return null;
  }

  String validateUsername(String value) {
    if (value.length == 0)
      return 'You must enter your username';
    else
      return null;
  }
}
