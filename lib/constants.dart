import 'package:flutter/material.dart';

const Color kpink = Color(0xFFEB455F);
const Color kbase=Color(0xFFFCFFE7);
const Color klblue=Color(0xFFBAD7E9);
const Color kdblue=Color(0xFF2B3467);

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