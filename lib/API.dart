import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/custom_snackBar.dart';
import 'package:flutter_app/login_model.dart';
import 'package:http/http.dart' as http;

class Api {
  BuildContext context;
  Api(@required this.context);

  Future userLogin(GlobalKey<ScaffoldState> _scaffoldKey, String username,
      String password) async {
    final String apiUrl =
        "http://41.38.123.212:7001/test/resources/customers/credCRM?p_userId=$username&p_pass=$password";
    final response = await http.get(
      apiUrl,
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
      },
    );
    Map<String, dynamic> dataContent = json.decode(response.body);
    if (response.statusCode == 200) {
      CustomSnackBar(_scaffoldKey,
          json.decode(response.body)["technicalList"][0].toString());
      return UserLogin.fromJson(dataContent);
    } else {
      CustomSnackBar(_scaffoldKey, response.body.toString());
      return false;
    }
  }
}
