import 'package:flutter/material.dart';
import 'package:power_she_pre/screens//helper/helper_function.dart';
import 'package:power_she_pre/screens/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../components/AlertBox.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // login
  Future loginWithUserNameandPassword(
      String email, String password, context) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        return true;
      }
    } catch (e) {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertBox(
            titleText: 'The email or password is incorrect.',
            bodyText: '',
            finalText: 'Retry',
          );
        },
      );
    }
  }

  // register
  Future registerUserWithEmailandPassword(String fullName, String email,
      String password, String phoneNumber, String safety, context) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        // call our database service to update the user data.
        await DatabaseService(uid: user.uid)
            .savingUserData(fullName, email, phoneNumber, safety);
        return true;
      }
    } catch (e) {
      print(e);
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertBox(
            titleText: 'Please check the following:',
            bodyText:
                '• Your name must have at least one character. \n\n• Enter a valid email address which is not previously registered on the app. \n\n• Enter a valid phone number. \n\n• Your password must have at least 6 characters.',
            finalText: 'Retry',
          );
        },
      );
    }
  }
}
