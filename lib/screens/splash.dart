import 'package:flutter/material.dart';
import 'package:power_she_pre/constants.dart';
import 'package:power_she_pre/screens/home_screen.dart';
import 'dart:async';
import 'package:power_she_pre/screens/onboard/onboardScreen.dart';
import 'package:power_she_pre/screens/welcome_screen.dart';

import 'helper/helper_function.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "splash_screen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isSignedIn = false;
  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
    Timer(
        Duration(seconds: 5),
        _isSignedIn
            ? () => Navigator.pushNamed(context, HomeScreen.id)
            : () => Navigator.pushNamed(context, OnboardScreen.id));
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbase,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Image.asset(
                  'images/splash_gif.gif',
                  width: MediaQuery.of(context).size.width * 0.99,
                  height: MediaQuery.of(context).size.height * 0.99,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
