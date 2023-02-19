import 'package:flutter/material.dart';
import 'package:power_she_pre/components/BottomBar.dart';
import 'package:power_she_pre/components/EndDrawer.dart';
import 'package:power_she_pre/constants.dart';
import 'package:power_she_pre/components/card.dart';
// import 'package:power_she_pre/screens/safety_screen.dart';
import'package:power_she_pre/screens/splash.dart';
import'dart:async';
import'package:power_she_pre/screens/welcome_screen.dart';
import 'package:sidebarx/sidebarx.dart';
import '../components/appBarInit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class OprScreen extends StatefulWidget {
  static const String id = "opr";
  const OprScreen({super.key});

  @override
  State<OprScreen> createState() => _OprScreenState();
}

class _OprScreenState extends State<OprScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbase,
      appBar: AppBar(
        backgroundColor: kpink,
        title: Padding(
          padding: const EdgeInsets.only(right: 0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo.png',
                  fit: BoxFit.contain,
                  height: 32,
                ),
                Container(
                    padding: const EdgeInsets.all(8.0), child: Text('PowerShe'))
              ],

            ),
          ),
        ),
      ),
      endDrawer:EndDrawer(),
      bottomNavigationBar: BottomBar(),
      body: Scaffold(
        body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('opportunities').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            return Container(
                color: kbase,
                child: ListView(
                  children: snapshot.data!.docs.map((document) {
                  return Container(
                  child: CardLayout(url: document['url'],imageUrl: document['imageUrl'],subText: document['subText'],mainText: document['mainText']),
              );
            }).toList(),
          ),
        );
        }
        },
      ),
    ),
    );
  }

}
