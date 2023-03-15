import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:power_she_pre/screens/map/BusStationCard.dart';
import 'package:power_she_pre/screens/map/HospitalCard.dart';
import 'package:power_she_pre/screens/map/PharmacyCard.dart';
import 'package:power_she_pre/screens/map/PoliceStationCard.dart';

class Location extends StatefulWidget {
  static const String id = "location";
  // static const String id="course_screen";
  const Location({Key? key}) : super(key: key);
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  // const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    LiveSafe(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LiveSafe extends StatelessWidget {
  const LiveSafe({Key? key}) : super(key: key);

  static Future<void> openMap(String location) async {
    String googleUrl = 'https://www.google.com/maps/search/$location';
    final Uri _url = Uri.parse(googleUrl);
    try {
      await launchUrl(_url);
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'something went wrong! call emergency number');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          PoliceStationCard(onMapFunction: openMap),
          HospitalCard(onMapFunction: openMap),
          PharmacyCard(onMapFunction: openMap),
          BusStationCard(onMapFunction: openMap),
        ],
      ),
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
