import 'package:background_sms/background_sms.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:power_she_pre/components/EndDrawer.dart';
import 'package:power_she_pre/constants.dart';
import 'package:power_she_pre/myBody/healthIssues.dart';
import 'package:power_she_pre/myBody/menstruation.dart';
import 'package:power_she_pre/myBody/products.dart';
import 'package:power_she_pre/screens/ChatBotSupport/mainScreen.dart';
import 'package:power_she_pre/screens/Safety/db_services.dart';
import 'package:shake/shake.dart';

import '../components/AppBarHome.dart';
import '../components/BottomBar.dart';
import 'package:power_she_pre/myBody/puberty.dart';

import '../screens/Safety/contactModel.dart';

class BHomeScreen extends StatefulWidget {
  static const String id = "bhome_screen";
  const BHomeScreen({Key? key}) : super(key: key);

  @override
  State<BHomeScreen> createState() => _BHomeScreenState();
}

class _BHomeScreenState extends State<BHomeScreen> {
  Position? _curentPosition;
  String? _curentAddress;
  LocationPermission? permission;
  _getPermission() async => await [Permission.sms].request();
  _isPermissionGranted() async => await Permission.sms.status.isGranted;
  _sendSms(String phoneNumber, String message, {int? simSlot}) async {
    SmsStatus result = await BackgroundSms.sendMessage(
        phoneNumber: phoneNumber, message: message, simSlot: 1);
    if (result == SmsStatus.sent) {
      print("Sent");
      Fluttertoast.showToast(msg: "send");
    } else {
      Fluttertoast.showToast(msg: "failed");
    }
  }

  _getCurrentLocation() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      Fluttertoast.showToast(msg: "Location permissions are  denind");
      if (permission == LocationPermission.deniedForever) {
        await Geolocator.requestPermission();
        Fluttertoast.showToast(
            msg: "Location permissions are permanently denind");
      }
    }
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _curentPosition = position;
        print(_curentPosition!.latitude);
        _getAddressFromLatLon();
      });
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
  }

  _getAddressFromLatLon() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _curentPosition!.latitude, _curentPosition!.longitude);

      Placemark place = placemarks[0];
      setState(() {
        _curentAddress =
            "${place.locality},${place.postalCode},${place.street},";
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  getAndSendSms() async {
    List<TContact> contactList = await DatabaseHelper().getContactList();

    String messageBody ='';
    print( '$_curentPosition Hello pogo');
    if(_curentPosition!=null)
        messageBody="https://maps.google.com/?daddr=${_curentPosition!.latitude},${_curentPosition!.longitude}";
       
    if (await _isPermissionGranted()) {
      contactList.forEach((element) {
        _sendSms("${element.number}", "I am in trouble $messageBody");
      });
    } else {
      Fluttertoast.showToast(msg: "something wrong");
    }
  }

  @override
  void initState() {
    super.initState();
    _getPermission();
    _getCurrentLocation();
    ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        getAndSendSms();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Shake!'),
          ),
        );
        // Do stuff on phone shake
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );

    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kbase,
        ////extendBodyBehindAppBar: true,
        appBar: AppBarHome(heading: 'Self Care'),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(30),
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Card(
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(20.0),
              //   ),
              //   // color: Color.fromARGB(255, 244, 220, 164),
              //   child: SizedBox(
              //     width: 350,
              //     height: 200,
              //     child: Stack(
              //       alignment: Alignment.bottomCenter,
              //       children: <Widget>[
              //           FittedBox(
              //             child: Image.asset('images/Puberty.jpg'),
              //             fit: BoxFit.fill,
              //           ),
              //           Text("Puberty"),
              //       ]
              //     ),
              //   ),
              // ),

              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Puberty()));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // color: Color.fromARGB(255, 244, 220, 164),
                  child: SizedBox(
                    width: 300,
                    height: 200,
                    child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset('images/Puberty.jpg',
                                fit: BoxFit.cover),
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                              ),
                              color: Color.fromARGB(255, 219, 206, 206)
                                  .withOpacity(0.5),
                            ),
                            child: Center(
                              child: Text(
                                "Puberty",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Menstruation()));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // color: Color.fromARGB(255, 244, 220, 164),
                  child: SizedBox(
                    width: 300,
                    height: 200,
                    child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset('images/Menstruation.jpeg'),
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                              ),
                              color: Color.fromARGB(255, 219, 206, 206)
                                  .withOpacity(0.5),
                            ),
                            child: Center(
                              child: Text(
                                "Menstruation",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HealthIssues()));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Color.fromARGB(255, 248, 228, 189),
                  child: SizedBox(
                    width: 300,
                    height: 200,
                    child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset('images/HealthIssues.jpg',
                                height: double.infinity,
                                width: double.infinity),
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                              ),
                              color: Color.fromARGB(255, 219, 206, 206)
                                  .withOpacity(0.5),
                            ),
                            child: Center(
                              child: Text(
                                "Health Issues",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Products()));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // color: Color.fromARGB(255, 244, 220, 164),
                  child: SizedBox(
                    width: 300,
                    height: 200,
                    child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'images/Products.jpg',
                              height: 200,
                            ),
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                              ),
                              color: Color.fromARGB(255, 219, 206, 206)
                                  .withOpacity(0.5),
                            ),
                            child: Center(
                              child: Text(
                                "Products",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            popUpDialog(context);
          },
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(
            Icons.chat_bubble,
            color: Colors.white,
            size: 30,
          ),
        ),
        endDrawer: EndDrawer(),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }

  popUpDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: ((context, setState) {
            return mainChatScreen();
          }));
        });
  }
}
