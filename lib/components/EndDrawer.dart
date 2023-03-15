import 'package:flutter/material.dart';
import 'package:power_she_pre/screens/Safety/mainScreen.dart';
import 'package:power_she_pre/screens/Tracker/TrackerPage.dart';
// import 'package:power_she_pre/Ptracker/mainScreenPeriod.dart';
import 'package:power_she_pre/screens/seller_buyer/orders.dart';
import 'package:power_she_pre/screens/welcome_screen.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:power_she_pre/constants.dart';
import 'package:power_she_pre/screens/user_profile.dart';
import 'package:power_she_pre/screens/ChatBotSupport/mainScreen.dart';
import 'package:power_she_pre/screens/group_chat/groupsHomeScreen.dart';

import '../screens/seller_buyer/my_products.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: SidebarXController(selectedIndex: 0, extended: true),
      theme: SidebarXTheme(
        selectedItemDecoration: BoxDecoration(color: kpink),
        // padding: EdgeInsets.all(20),
        width: 200,
        decoration: BoxDecoration(color: klblue),
        textStyle: TextStyle(
          fontSize: 20,
          color: kdblue,
        ),
        selectedTextStyle: TextStyle(
          fontSize: 20,
          color: kbase,
        ),
        selectedIconTheme: IconThemeData(color: kbase),
        iconTheme: IconThemeData(color: kdblue),
        selectedItemTextPadding: EdgeInsets.only(left: 20),
        itemTextPadding: EdgeInsets.only(left: 20),
      ),
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
            label: 'Tracker',
            onTap: () {
              Navigator.pushNamed(context, TrackerPage.id);
            }),
        SidebarXItem(
            icon: Icons.call_end,
            label: 'safteyCall',
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
            icon: Icons.chat_bubble,
            label: 'ChatSupport',
            onTap: () {
              Navigator.pushNamed(context, mainChatScreen.id);
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
