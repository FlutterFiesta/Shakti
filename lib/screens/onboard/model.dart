import 'package:flutter/material.dart';

class OnboardModel {
  String img;
  String text;
  Color bg;
  Color button;

  OnboardModel({
    required this.img,
    required this.text,
    required this.bg,
    required this.button,
  });
}

List<OnboardModel> screens = <OnboardModel>[
  OnboardModel(
    img: 'images/Main.webp',
    text: "Empower women physically, mentally and financially",
    bg: Colors.white,
    button: Color(0xFF4756DF),
  ),
  OnboardModel(
    img: 'images/Education.webp',
    text: "Learn and explore with the tutorials available",
    bg: Color(0xFF4756DF),
    button: Colors.white,
  ),
  OnboardModel(
    img: 'images/Community.png',
    text: "Share feelings and grievances with other women and counsellor",
    bg: Colors.white,
    button: Color(0xFF4756DF),
  ),
  OnboardModel(
    img: 'images/Shop.png',
    text: "Buy and sell your products from home itself",
    bg: Colors.white,
    button: Color(0xFF4756DF),
  ),
  OnboardModel(
    img: 'images/Opportunities.jpg',
    text: "Search for the available opportunities and scholarships",
    bg: Color(0xFF4756DF),
    button: Colors.white,
  ),
  OnboardModel(
    img: 'images/SafetyC.png',
    text: "Feel safe with alerts and safe locations",
    bg: Colors.white,
    button: Color(0xFF4756DF),
  ),
];
