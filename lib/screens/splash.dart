import 'package:firebase_messaging/firebase_messaging.dart';
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
// 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          // LocalNotificationService.display(message);

        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );

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
