import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:power_she_pre/components/EndDrawer.dart';
import 'package:power_she_pre/constants.dart';
import 'package:power_she_pre/components/RoundedButton.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:power_she_pre/screens/ChatBotSupport/mainScreen.dart';
import 'package:power_she_pre/screens/opr_screen.dart';
import 'dart:io';
import 'dart:async';
import 'package:sidebarx/sidebarx.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:power_she_pre/components/AlertBox.dart';
import 'package:power_she_pre/components/AppBarHome.dart';
import 'package:power_she_pre/components/BottomBar.dart';

import 'Safety/mainScreen.dart';
import 'Tracker/TrackerPage.dart';

class UserProfile extends StatefulWidget {
  static const String id = "user_profile";
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedInUser;
  String userId = '';
  String userName = '';
  String userEmail = '';
  String userPhone = '';
  String userSafety = '';
  String url='';
  @override
  void initState() {
    // TODO: implement initState
    try {
      final user = _auth.currentUser;
      if (user != null) {
        setState(() {
          loggedInUser = user;
          userId = user.uid;
        });
        getDoc();
      }
    } catch (e) {
      print(e);
      Navigator.pop(context);
    }
  }

  void getDoc() async {
    final docref = await _firestore.collection("users").doc(userId).get();
    setState(() {
      userName = docref['fullName'];
      userEmail = docref['email'];
      userPhone = docref['phoneNumber'];
      userSafety = docref['safety'];
      url=docref['url'];
      print(url);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool spinner = false;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kbase,
        appBar: AppBarHome(heading: 'Profile'),
        endDrawer: EndDrawer(),
        bottomNavigationBar: BottomBar(),
        body: ModalProgressHUD(
          inAsyncCall: spinner,
          child: SingleChildScrollView(
            child: SafeArea(
              child: (userName == '')
                  ? SizedBox(
                height: MediaQuery.of(context).size.height / 1.1,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
              )
                  :
              Padding(
                padding: EdgeInsets.fromLTRB(12, 60, 12, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 63,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(url),
                        radius: 60,
                      ),
                    ),
                    // CircleAvatar(
                    //   backgroundImage:
                    //   NetworkImage(url),
                    //   radius:70,
                    // ),
                    ListTile(
                      title: Padding(
                        padding:
                        const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      subtitle: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  userName,
                                  style: TextStyle(fontSize: 20),
                                ), // <-- Text
                                // SizedBox(
                                //   width: 85,
                                // ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          AlertDialog(
                                            title:
                                            Text('Change your name '),
                                            content: TextField(
                                              decoration:
                                              const InputDecoration(
                                                  border:
                                                  UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Color
                                                            .fromARGB(
                                                            255,
                                                            21,
                                                            101,
                                                            192)),
                                                  ),
                                                  enabledBorder:
                                                  UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Color
                                                            .fromARGB(
                                                            255,
                                                            21,
                                                            101,
                                                            192),
                                                        width: 1.0),
                                                  ),
                                                  focusedBorder:
                                                  UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Color
                                                            .fromARGB(
                                                            255,
                                                            21,
                                                            101,
                                                            192),
                                                        width: 2.0),
                                                  ),
                                                  hintText:
                                                  'Your name'),
                                              onChanged: (value) {
                                                setState(() {
                                                  userName = value;
                                                });
                                              },
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Change',
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255,
                                                        21,
                                                        101,
                                                        192),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                    );
                                  },
                                  child: Icon(
                                    // <-- Icon
                                    Icons.edit,
                                    size: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color:
                              Color.fromARGB(255, 21, 101, 192),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Padding(
                        padding:
                        const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Text(
                          'Phone Number',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      subtitle: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  userPhone,
                                  style: TextStyle(fontSize: 20),
                                ), // <-- Text
                                // SizedBox(
                                //   width: 60,
                                // ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          AlertDialog(
                                            title: Text(
                                                'Change your phone number '),
                                            content: TextField(
                                              decoration:
                                              const InputDecoration(
                                                  border:
                                                  UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Color
                                                            .fromARGB(
                                                            255,
                                                            21,
                                                            101,
                                                            192)),
                                                  ),
                                                  enabledBorder:
                                                  UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Color
                                                            .fromARGB(
                                                            255,
                                                            21,
                                                            101,
                                                            192),
                                                        width: 1.0),
                                                  ),
                                                  focusedBorder:
                                                  UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Color
                                                            .fromARGB(
                                                            255,
                                                            21,
                                                            101,
                                                            192),
                                                        width: 2.0),
                                                  ),
                                                  hintText:
                                                  'Your phone number'),
                                              onChanged: (value) {
                                                setState(() {
                                                  userPhone = value;
                                                });
                                              },
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Change',
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255,
                                                        21,
                                                        101,
                                                        192),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                    );
                                  },
                                  child: Icon(
                                    // <-- Icon
                                    Icons.edit,
                                    size: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color:
                              Color.fromARGB(255, 21, 101, 192),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Padding(
                        padding:
                        const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Text(
                          'Email ID',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      subtitle: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  userEmail,
                                  style: TextStyle(fontSize: 20),
                                ), // <-- Text
                                // SizedBox(
                                //   width: 60,
                                // ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          AlertDialog(
                                            title: Text(
                                                'You cannot change your email address.'),
                                            content: Text(''),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Ok',
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255,
                                                        21,
                                                        101,
                                                        192),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                    );
                                  },
                                  child: Icon(
                                    // <-- Icon
                                    Icons.edit,
                                    size: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color:
                              Color.fromARGB(255, 21, 101, 192),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: RoundedButton(
                          buttonText: 'Save Changes',
                          textSize: 18,
                          buttonSize: 150,
                          onPressed: () async {
                            setState(() {
                              spinner = true;
                            });
                            await _firestore
                                .collection('users')
                                .doc(userId)
                                .update({
                              'fullName': userName,
                              'phoneNumber': userPhone,
                              'email': userEmail,
                              'safety': userSafety,
                            });
                            setState(() {
                              spinner = false;
                            });
                            Navigator.pop(context);
                          }),
                    ),
                  ],
                ),
              ),
              // ],
              // )
            ),
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