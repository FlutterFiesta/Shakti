import 'package:flutter/material.dart';

const Color kpink = Color(0xFFFF5C8D);
const Color kbase = Color(0xFFfdfdfc);
const Color klblue=Color(0xFFFFD3B6);
const Color kdblue=Color(0xFF191825);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kpink, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kpink, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kProductFieldDecoration = InputDecoration(
  hintText: 'Enter value',
  labelText:'Enter label',
  labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    color: kdblue
    ),
  contentPadding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kpink, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kpink, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);