import 'package:flutter/material.dart';
import 'package:power_she_pre/constants.dart';
import 'package:power_she_pre/components/AppButton.dart';
import 'package:power_she_pre/screens/authentication/registration.dart';
import 'package:power_she_pre/screens/authentication/login.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = "welcome_screen";
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbase,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'images/logo.png',
                            width: 250,
                            height: 250,
                          ),
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 250),
                              child: Text(
                                "PowerShe",
                                style: TextStyle(
                                  fontSize: 45,
                                  color: kdblue,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'CinzelDecorative',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 200,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Center(
                                child: Text(
                                  "Get started with",
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(0, 6, 6, 6),
                              child: Center(
                                child: Text(
                                  "Power She",
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      AppButton(
                        buttonText: "Sign Up",
                        onPressed: () => Navigator.pushNamed(
                            context, RegisterationScreen.id),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppButton(
                        buttonText: "Log In",
                        onPressed: () =>
                            Navigator.pushNamed(context, LoginScreen.id),
                      ),
                      // TextButton(
                      //   onPressed: () =>
                      //       Navigator.pushNamed(context, LoginScreen.id),
                      //   child: const Text(
                      //     "Already have an account? Login",
                      //     style: TextStyle(
                      //       fontSize: 21,
                      //       color: Colors.black,
                      //       fontWeight: FontWeight.w700,
                      //       decoration: TextDecoration.underline,
                      //     ),
                      //   ),
                      // )
                    ]),
              ),
            ),
          ),
        ));
  }
}
