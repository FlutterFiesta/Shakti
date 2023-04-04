import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:power_she_pre/myBody/bmain.dart';
import 'package:power_she_pre/screens/Safety/mainScreen.dart';
import 'package:power_she_pre/screens/Tracker/TrackerPage.dart';
import 'package:power_she_pre/screens/home_screen.dart';
import 'package:power_she_pre/screens/opr_screen.dart';
import 'package:power_she_pre/screens/seller_buyer/orders.dart';
import 'package:power_she_pre/screens/welcome_screen.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:power_she_pre/constants.dart';
import 'package:power_she_pre/screens/user_profile.dart';
import 'package:power_she_pre/screens/ChatBotSupport/mainScreen.dart';
import 'package:power_she_pre/screens/helper/helper_function.dart';
import 'package:power_she_pre/screens/group_chat/groupsHomeScreen.dart';

import '../screens/map/location.dart';
import '../screens/seller_buyer/my_products.dart';

import '../screens/org.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({Key? key}) : super(key: key);

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedInUser;
  String userId = '';
  String userName = '';
  String url = '';
  void initState() {
    // TODO: implement initState
    try {
      final user = _auth.currentUser;
      if (user != null) {
        setState(() {
          loggedInUser = user;
          userId = user.uid;
        });
        getDoc();
      }
    } catch (e) {
      print(e);
      Navigator.pop(context);
    }
  }

  void getDoc() async {
    final docref = await _firestore.collection("users").doc(userId).get();
    setState(() {
      userName = docref['fullName'];
      url = docref['url'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: SidebarXController(selectedIndex: 0, extended: true),
      showToggleButton: false,
      theme: SidebarXTheme(
        selectedItemDecoration: BoxDecoration(
            color: kpink, borderRadius: BorderRadius.circular(17.0)),
        width: MediaQuery.of(context).size.width * 0.75,
        decoration: BoxDecoration(
            color: kbase,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            )),
        textStyle: TextStyle(
          fontSize: 17,
          color: kdblue,
        ),
        selectedTextStyle: TextStyle(
          fontSize: 17,
          color: kbase,
        ),
        iconTheme: IconThemeData(color: kdblue),
        selectedItemTextPadding: EdgeInsets.only(left: 20),
        itemTextPadding: EdgeInsets.only(left: 20),
        selectedIconTheme: IconThemeData(color: kbase),
      ),
      headerBuilder: (context, extended) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 58,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(url),
                    radius: 55,
                  ),
                ),
              ),
              Text(
                userName,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 2,
              ),
            ],
          ),
        );
      },
      items: [
        SidebarXItem(
            icon: Icons.account_circle_rounded,
            label: 'Profile',
            onTap: () {
              Navigator.pushNamed(context, UserProfile.id);
            }),
        SidebarXItem(
            icon: Icons.shopping_cart_rounded,
            label: 'My Orders',
            onTap: () {
              Navigator.pushNamed(context, OrderScreen.id);
            }),
        SidebarXItem(
            icon: Icons.sell,
            label: 'My Products',
            onTap: () {
              Navigator.pushNamed(context, MyProducts.id);
            }),
        SidebarXItem(
            icon: Icons.video_camera_back_rounded,
            label: 'Education',
            onTap: () {
              Navigator.pushNamed(context, HomeScreen.id);
            }),
        SidebarXItem(
            icon: Icons.location_on,
            label: 'Location',
            onTap: () {
              Navigator.pushNamed(context, Location.id);
            }),
        SidebarXItem(
            icon: Icons.call_end,
            label: 'Safety Call',
            onTap: () {
              Navigator.pushNamed(context, AddContactsPage.id);
            }),
        SidebarXItem(
            icon: Icons.person,
            label: 'Organizations',
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Org()));
            }),
        SidebarXItem(
            icon: Icons.school,
            label: 'Opportunities',
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => OprScreen()));
            }),
        SidebarXItem(
          icon: Icons.logout_rounded,
          label: 'Logout',
          onTap: () async {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Logout"),
                    content: const Text("Are you sure you want to logout?"),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, WelcomeScreen.id);
                        },
                        icon: const Icon(
                          Icons.done,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  );
                });
          },
        ),
      ],
    );
  }
}