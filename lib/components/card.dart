import 'package:flutter/material.dart';
import 'package:power_she_pre/constants.dart';
import 'package:power_she_pre/components/RoundedButton.dart';
import 'package:power_she_pre/components/appBarInit.dart';
import 'dart:io';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class CardLayout extends StatelessWidget {
  final String url;
  // final String imageText;
  final String mainText;
  final String subText;
  final String imageUrl;

  CardLayout(
      {required this.url,
      // required this.imageText,
      required this.mainText,
      required this.subText,
      required this.imageUrl});

late Uri _url = Uri.parse(url);
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
      elevation: 10,
      shadowColor: Colors.black,
      color: Colors.white,
      child: SizedBox(
        width: 200,
        // height: 360,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //CircleAvatar
              //SizedBox
              //Text

              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      // image: AssetImage('images/OprCard.png),
                      image: NetworkImage(imageUrl),
                    ),
                  ),
                  // child: Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Container(
                  //     width: 150.0,
                  //     height: 150,
                  //     margin: EdgeInsets.only(left: 10.0),
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //         imageText,
                  //         style: TextStyle(
                  //           fontSize: 25.0,
                  //         ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ), // Container
              ), //Text
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                    child: Text(mainText,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        )),
                  )),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  subText,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: _launchUrl,
                color: kdblue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Check',
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