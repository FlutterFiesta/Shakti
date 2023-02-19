import 'package:flutter/material.dart';
import 'package:power_she_pre/screens/orders.dart';
import 'package:power_she_pre/screens/welcome_screen.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:power_she_pre/constants.dart';
import '../screens/my_products.dart';
import 'package:power_she_pre/screens/user_profile.dart';

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
            SidebarXItem(icon: Icons.account_circle_rounded, label: 'Profile', onTap: () {
              Navigator.pushNamed(context, UserProfile.id);
            }),
            SidebarXItem(
                icon: Icons.shopping_cart_rounded,
                label: 'My Orders',
                onTap: () {
                  Navigator.pushNamed(context, OrderScreen.id);
                }),
            SidebarXItem(
                icon: Icons.sell, label: 'My Products', onTap: () {
              Navigator.pushNamed(context, MyProducts.id);
            }),
            SidebarXItem(
                icon: Icons.logout_rounded ,
                label: 'Logout',
                onTap: () {
                  Navigator.pushNamed(context, WelcomeScreen.id);
                }),
          ],
        );
  }
}