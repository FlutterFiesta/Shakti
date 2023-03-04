import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:power_she_pre/screens/home_screen.dart';
import 'package:power_she_pre/constants.dart';
import 'package:power_she_pre/components/AlertBox.dart';
import 'package:power_she_pre/components/RoundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:power_she_pre/screens/authentication/registration.dart';

import '../helper/helper_function.dart';
import '../service/auth_service.dart';
import '../service/database_service.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService authService = AuthService();
  // final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool spinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    padding: const EdgeInsets.all(8.0), child: Text('Login'))
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
                                hintText: 'Email Address'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: RoundedButton(
                      buttonText: "Log In",
                      onPressed: () async {
                        setState(() {
                          spinner = true;
                        });
                        await authService
                            .loginWithUserNameandPassword(
                                email, password, context)
                            .then((value) async {
                          if (value == true) {
                            QuerySnapshot snapshot = await DatabaseService(
                                    uid: FirebaseAuth.instance.currentUser!.uid)
                                .gettingUserData(email);
                            // saving the values to our shared preferences
                            await HelperFunctions.saveUserLoggedInStatus(true);
                            await HelperFunctions.saveUserEmailSF(email);
                            await HelperFunctions.saveUserNameSF(
                                snapshot.docs[0]['fullName']);
                            await HelperFunctions.saveUserPhoneSF(
                                snapshot.docs[0]['phoneNumber']);
                            Navigator.pushNamed(context, HomeScreen.id);
                          } else {
                            setState(() {
                              spinner = false;
                            });
                          }
                        });
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text.rich(TextSpan(
                  text: "Don't have an account? ",
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Register here",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                                context, RegisterationScreen.id);
                          }),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
