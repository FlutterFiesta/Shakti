import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:power_she_pre/components/EndDrawer.dart';
import 'package:power_she_pre/constants.dart';
import '../components/AppBarHome.dart';
import '../components/BottomBar.dart';
import '../components/card.dart';


class Products extends StatelessWidget {
  static const String id = "products";
  Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome(heading: 'Products'),
      endDrawer: EndDrawer(),
      bottomNavigationBar: BottomBar(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('bodyProduct').snapshots(),
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
    );   
  }
}