import 'dart:async';

import 'package:flutter/material.dart';
import 'package:molekola/pages/authentication_page.dart';

class SplashPage extends StatefulWidget {
  static String ROUTE = '/splash';
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _routeToLogin() {
    // Remove Current View from stack
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => AuthenticationPage()));
  }

  @override
  Widget build(BuildContext context) {
    //////////// Timer ////////////
    Timer.periodic(Duration(seconds: 1), (timer) {
      timer.cancel();
      _routeToLogin();
    });
    /////////// Timer ////////////

    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 80, 20, 20),
          ),
          Image(
            image: AssetImage('assets/images/molekola-logo.png'),
            width: 200,
          )
        ],
      )),
    );
  }
}
