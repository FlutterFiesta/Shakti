import 'package:flutter/material.dart';
import'package:power_she_pre/constants.dart';

class AppBarInit extends StatelessWidget {
  const AppBarInit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'images/logo.png',
        width: 50,
        height: 50,
      ),
      backgroundColor: kpink,
      toolbarHeight: 70,
      elevation: 5,
      centerTitle: true,
    );
  }
}