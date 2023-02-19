import 'package:flutter/material.dart';
import 'package:power_she_pre/constants.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  Color buttonColor;
  AppButton({required this.buttonText, required this.onPressed,this.buttonColor=kpink});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: this.onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          this.buttonText,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      color: buttonColor,
      minWidth: 250,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
