import 'package:flutter/material.dart';
import 'package:power_she_pre/myBody/bmain.dart';
import 'package:power_she_pre/screens/Safety/mainScreen.dart';
import 'package:power_she_pre/screens/Tracker/TrackerPage.dart';
import 'package:power_she_pre/screens/seller_buyer/orders.dart';
import 'package:power_she_pre/screens/welcome_screen.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:power_she_pre/constants.dart';
import 'package:power_she_pre/screens/user_profile.dart';
import 'package:power_she_pre/screens/ChatBotSupport/mainScreen.dart';
import 'package:power_she_pre/screens/group_chat/groupsHomeScreen.dart';


import '../screens/seller_buyer/my_products.dart';

import '../screens/org.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: SidebarXController(selectedIndex: 0, extended: true),
      showToggleButton: false,
      theme: SidebarXTheme(
        selectedItemDecoration: BoxDecoration(color: kpink, borderRadius: BorderRadius.circular(17.0)),
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
      ),
      headerBuilder: (context, extended){
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Icon(
                Icons.account_circle,
                size: 80,
                color: kdblue,
              ),
              Text(
                "User",
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
            icon: Icons.water_drop,
            label: 'My Flow Tracker',
            onTap: () {
              Navigator.pushNamed(context, TrackerPage.id);
            }),
        SidebarXItem(
            icon: Icons.call_end,
            label: 'Safety Call',
            onTap: () {
              Navigator.pushNamed(context, AddContactsPage.id);
            }),
        SidebarXItem(
            icon: Icons.sell,
            label: 'My Products',
            onTap: () {
              Navigator.pushNamed(context, MyProducts.id);
            }),
        SidebarXItem(
            icon: Icons.chat,
            label: 'Community',
            onTap: () {
              Navigator.pushNamed(context, groupsHome.id);
            }),
        SidebarXItem(
            icon: Icons.person,
            label: 'Organizations',
            onTap: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Org()));
            }),
        SidebarXItem(
            icon: Icons.self_improvement_rounded,
            label: 'Self Care',
            onTap: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BHomeScreen()));
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
