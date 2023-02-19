import'package:flutter/material.dart';
import'package:power_she_pre/constants.dart';
import'package:power_she_pre/screens/splash.dart';
import'dart:async';
import'package:power_she_pre/screens/welcome_screen.dart';
import'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';



class Course extends StatefulWidget {
  static const String id="course_screen";
  const Course({Key? key}) : super(key: key);

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
    @override
    int _selectedIndex = 1; //defaultindex

    List<Widget> _widgetOptions = [
      Text('Home'),
      Text('Account'),
      Text('Leaves'),
      Text('Loyalty'),
      Text('Requests'),
    ];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Example'),
        ),
        body: Center(
          child: Text('New'),
        ),
        // bottomNavigationBar: bottomBar(selectedIndex: _selectedIndex,),
      );
    }
  }

