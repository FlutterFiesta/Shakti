import 'package:flutter/material.dart';
import 'package:power_she_pre/components/RoundedButton.dart';
import 'package:power_she_pre/components/AlertBox.dart';
import 'package:power_she_pre/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:power_she_pre/screens/gender_auth/selfie_upload.dart';
import 'package:power_she_pre/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:power_she_pre/screens/welcome_screen.dart';

class RegisterationScreen extends StatefulWidget {
  static const String id = "registeration_screen";
  const RegisterationScreen({Key? key}) : super(key: key);

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String? gender;
  late String email;
  late String password;
  late String name;
  late String phoneNumber;
  CountryCode countryCode = CountryCode(name: "IN", dialCode: '+91');
  bool spinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: kpink,
        title: Padding(
          padding: const EdgeInsets.only(right: 40),
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
        backgroundColor: kbase,
        body: ModalProgressHUD(
          inAsyncCall: spinner,
          progressIndicator: const CircularProgressIndicator(
            color: kpink,
          ),
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: const Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: Text(
                                "Enter your name",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          TextField(
                            keyboardType: TextInputType.name,
                            textAlign: TextAlign.left,
                            onChanged: (value) {
                              //Do something with the user input.
                              name = value;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'abc xyz'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: const Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: Text(
                                "Enter your email address",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.left,
                            onChanged: (value) {
                              //Do something with the user input.
                              email = value;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'abc@xyz.op'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: const Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: Text(
                                "Enter your phone number",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              CountryCodePicker(
                                onChanged: (value) {
                                  countryCode = value;
                                },
                                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                initialSelection: 'IN',
                                favorite: ['+91', 'IN'],
                                // optional. Shows only country name and flag
                                showCountryOnly: false,
                                // optional. Shows only country name and flag when popup is closed.
                                showOnlyCountryWhenClosed: false,
                                // optional. aligns the flag and the Text left
                                alignLeft: false,
                              ),
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  textAlign: TextAlign.left,
                                  onChanged: (value) {
                                    //Do something with the user input.
                                    phoneNumber = "$countryCode$value";
                                  },
                                  decoration: kTextFieldDecoration.copyWith(
                                      hintText: 'Phone Number'),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: const Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: Text(
                                "Enter your gender",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              RadioListTile(
                                activeColor: kpink,
                                title: Text("Female"),
                                value: "Female",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                              RadioListTile(
                                activeColor: kpink,
                                title: Text("Male"),
                                value: "Male",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: const Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: Text(
                                "Enter your password",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          TextField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            textAlign: TextAlign.left,
                            onChanged: (value) {
                              //Do something with the user input.
                              password = value;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Password'),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: RoundedButton(
                            buttonText: "Sign up",
                            onPressed: () async {
                              if (gender == "Male") {
                                showDialog<void>(
                                    context: context,
                                    barrierDismissible:
                                        false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                            'Sorry, this application is only for women!'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text(
                                                  'This application is built to empower women physically, mentally and financially, share this with your female family member, friend or neighbour.'),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text(
                                              'Thanks for downloading!',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: kpink,
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, WelcomeScreen.id);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              } else {
                                setState(() {
                                  spinner = true;
                                });
                                try {
                                  final newUser = await _auth
                                      .createUserWithEmailAndPassword(
                                          email: email, password: password);
                                  if (newUser != null) {
                                    final user = _auth.currentUser;
                                    final userid = user?.uid;

                                    _firestore
                                        .collection('details')
                                        .doc(userid)
                                        .set({
                                      'Email': email,
                                      'Name': name,
                                      'Phone': phoneNumber,
                                      'Safety':"",
                                    });
                                    Navigator.pushNamed(context, SelfieUpload.id);
                                    setState(() {
                                      spinner = false;
                                    });
                                  }
                                } catch (e) {
                                  print(e);
                                  setState(() {
                                    spinner = false;
                                  });
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible:
                                        false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertBox(
                                        titleText:
                                            'Please check the following:',
                                        bodyText:
                                            '• Your name must have at least one character. \n\n• Enter a valid email address which is not previously registered on the app. \n\n• Enter a valid phone number. \n\n• Your password must have at least 6 characters.',
                                        finalText: 'Retry',
                                      );
                                    },
                                  );
                                }
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
