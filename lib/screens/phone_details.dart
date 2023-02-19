import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:power_she_pre/constants.dart';
import 'package:power_she_pre/components/card.dart';
import 'package:power_she_pre/screens/home_screen.dart';
import'package:power_she_pre/screens/splash.dart';
import'dart:async';
import'package:power_she_pre/screens/welcome_screen.dart';
import 'package:sidebarx/sidebarx.dart';
import '../components/appBarInit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:power_she_pre/screens/phone_details.dart';
import 'package:power_she_pre/components/RoundedButton.dart';

class PhoneDetails extends StatefulWidget {
  static const String id = "phone_details";
  const PhoneDetails({super.key});

  @override
  State<PhoneDetails> createState() => _PhoneDetailsState();
}

class _PhoneDetailsState extends State<PhoneDetails> {
  @override
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedInUser;
  String userId = '';
  String phone='';
  final snackBar = SnackBar(
    content: Text('Emergency Contact Added!'),
  );
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
      endDrawer:SidebarX(
        controller: SidebarXController(selectedIndex: 0, extended: true),
        theme: SidebarXTheme(
          selectedItemDecoration: BoxDecoration(
            color:kpink
          ),
          // padding: EdgeInsets.all(20),
          width:200,
          decoration: BoxDecoration(
            color: klblue
          ),
          textStyle: TextStyle(
            fontSize:20,
            color: kdblue,
          ),
          selectedTextStyle: TextStyle(
            fontSize: 20,
            color:kbase,
          ),
          selectedIconTheme: IconThemeData(
            color: kbase
          ),
          iconTheme: IconThemeData(
            color: kdblue
          ),
          selectedItemTextPadding: EdgeInsets.only(left:20),
          itemTextPadding: EdgeInsets.only(left:20),
        ),
        items: [
          SidebarXItem(icon: Icons.home, label: 'Home',onTap:(){}),
          SidebarXItem(icon: Icons.search, label: 'Search'),
        ],
      ),
      bottomNavigationBar: Container(
        height: 90,
        child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomAppBar(
              clipBehavior: Clip.none,
              color: kpink,
              shape: CircularNotchedRectangle(),
              notchMargin: 10,
              child: Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              // currentScreen = HomeScreen();
                              // currentTab = 0;
                            });

                            // Navigator.pushNamed(context, UploadImage.id);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [

                              Icon(
                                Icons.videocam,
                                color: Colors.white,
                                size: 20,
                              ),
                              Text(
                                'Tutorials',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:13.0),
                          child: MaterialButton(
                            minWidth: 40,
                            onPressed: () {

                              //   currentScreen = HomeScreen();
                              //   currentTab = 0;
                              // });
                              // Navigator.pushNamed(context, NearMe.id);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.storefront,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Text(
                                  'Store',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              // currentScreen = HomeScreen();
                              // currentTab = 0;
                            });
                            // Navigator.pushNamed(context, OprScreen.id);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.school,
                                color: Colors.white,
                                size: 20,
                              ),
                              Text(
                                'Opportunities',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              // currentScreen = HomeScreen();
                              // currentTab = 0;
                            });
                            // Navigator.pushNamed(context, UserProfile.id);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.groups,
                                color: Colors.white,
                                size: 20,
                              ),
                              Text(
                                'Support',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: SizedBox(
                width: 68,
                height: 68,
                child: FloatingActionButton(
                  clipBehavior: Clip.none,
                  onPressed: () {
                  },
                  backgroundColor: kdblue,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('images/safety.png'),
                  )
                ),
              ),
            ),
          ),
        ],
      ),
      ),
      body: Scaffold(
         backgroundColor: kbase,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Enter the phone no of the person who you want to call in an emergency:",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 33, vertical: 56),
                child: TextFormField(
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                  cursorHeight: 30,
                  cursorColor: Color(0xFFBAD7E9),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 4.0),
                    ),
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      phone=value;
                    });
                  },
                ),
              ),
              
              RoundedButton(
                  buttonText: 'Submit',
                onPressed:
                    () async {
                  // Navigator
                  //     .of(
                  //     context)
                  //     .pop();
                  // setState(
                  //         () {
                  //       spinner =
                  //       true;
                  //     });
                      print(phone);
                  await _firestore
                      .collection(
                      'details')
                      .doc(userId)
                      .update(
                      {
                        'Safety':phone,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pushNamed(context, HomeScreen.id);
                  // setState(
                  //         () {
                  //       spinner =
                  //       false;
                  //     });
                },
                  )
            ],
          ),
        ),
      ),
      ),
    );
  }
}