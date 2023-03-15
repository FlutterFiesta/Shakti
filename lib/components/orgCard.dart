import 'package:flutter/material.dart';
import 'package:power_she_pre/constants.dart';
import 'package:power_she_pre/components/RoundedButton.dart';
import 'package:power_she_pre/components/appBarInit.dart';
import 'dart:io';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class OrgCard extends StatelessWidget {
  final String url;
  final String mainText;
  final String location;
  final String subText;

  OrgCard(
      {required this.url,
      required this.mainText,
      required this.subText,
      required this.location});

late Uri _url = Uri.parse(url);
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(30.0),
      elevation: 10,
      shadowColor: Colors.black,
      color: Colors.white,
      child: SizedBox(
        width: 500,
        // height: 360,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  mainText,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  location,
                  style: TextStyle(
                    // fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  subText,
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: _launchUrl,
                color: Colors.blue[900],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Visit Site',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minWidth: 150,
                elevation: 5.0,
              )
            ],
          ), //Column
        ), //Padding
      ),
    );
  }
}