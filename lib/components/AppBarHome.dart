import 'package:flutter/material.dart';
import 'package:power_she_pre/constants.dart';

class AppBarHome extends StatelessWidget with PreferredSizeWidget {
  //const AppBarHome({Key? key}) : super(key: key);

  final String heading;

  AppBarHome({
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kpink,
      title: Padding(
        padding: const EdgeInsets.only(right: 40),
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
                  padding: const EdgeInsets.all(8.0), child: Text(heading))
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
