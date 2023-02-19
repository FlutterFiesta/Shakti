import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:power_she_pre/components/AppBarHome.dart';
import 'package:power_she_pre/components/EndDrawer.dart';
import 'package:power_she_pre/constants.dart';
import 'package:power_she_pre/components/card.dart';
import 'package:power_she_pre/screens/map/location.dart';
import 'package:power_she_pre/screens/opr_screen.dart';
import'package:power_she_pre/screens/splash.dart';
import'dart:async';
import'package:power_she_pre/screens/welcome_screen.dart';
import 'package:sidebarx/sidebarx.dart';
import '../components/BottomBar.dart';
import '../components/appBarInit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:power_she_pre/screens/phone_details.dart';
import 'package:url_launcher/url_launcher.dart';

class SafetyScreen extends StatefulWidget {
  static const String id = "safety_screen";
  const SafetyScreen({super.key});

  @override
  State<SafetyScreen> createState() => _SafetyScreenState();
}

class _SafetyScreenState extends State<SafetyScreen> {
  bool spinner = false;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedInUser;
  String userId = '';

  @override
  void initState() {
    // TODO: implement initState
    final user = _auth.currentUser;
    if (user != null) {
      setState(() {
        loggedInUser = user;
        userId = loggedInUser.uid;
      });
      print(userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbase,
      appBar: AppBarHome(),
      endDrawer:EndDrawer(),
      bottomNavigationBar: BottomBar(),
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        progressIndicator: const CircularProgressIndicator(
          color: kpink,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: ()async{
                  //


                  final docref = await _firestore.collection("details").doc(userId).get();
                  String phoneSafety =docref['Safety'];
                  print(phoneSafety);

                  if(phoneSafety.length==0){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => PhoneDetails()));
                  }else{
                    //Add code here
                    final Uri url = Uri(
                      scheme: 'tel',
                      path: phoneSafety,
                    );
                    if(await canLaunchUrl(url)){
                      await launchUrl(url);
                    }else{
                      print('Cannot launch this url!');
                    }
                  }
                },
                child: Image(
                  // width: 1.0,
                  image: AssetImage('images/Panic2.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}