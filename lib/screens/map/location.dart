import 'package:flutter/material.dart';
import './home_page.dart';
import 'package:power_she_pre/components/BottomBar.dart';
import 'package:power_she_pre/components/EndDrawer.dart';
import 'package:power_she_pre/constants.dart';

class Location extends StatelessWidget {
  static const String id = "location";
  const Location({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: kbase,
    appBar: AppBar(
    backgroundColor: kpink,
    title: Padding(
    padding: const EdgeInsets.only(right: 0),
    child: Center(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Image.asset(
    'images/logo.png',
    fit: BoxFit.contain,
    height: 32,
    ),
    Container(
    padding: const EdgeInsets.all(8.0), child: Text('PowerShe'))
    ],

    ),
    ),
    ),
    ),
    endDrawer:EndDrawer(),
    bottomNavigationBar: BottomBar(),
    body: HomePage(),
    );
  }
}

/*
title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomePage(),
 */


/*
class SplashScreenLocation extends StatefulWidget {
  const SplashScreenLocation({Key? key}) : super(key: key);

  @override
  _SplashScreenLocationState createState() => _SplashScreenLocationState();
}

class _SplashScreenLocationState extends State<SplashScreenLocation> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10)).then((value) => Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomePage())));
  }
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: 200.0,
            width: 200.0,
            child: LottieBuilder.asset('assets/animassets/mapanimation.json')),
      ),
    );
  }
}
*/