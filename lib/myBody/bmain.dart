import 'package:flutter/material.dart';
import 'package:power_she_pre/components/EndDrawer.dart';
import 'package:power_she_pre/constants.dart';

import '../components/AppBarHome.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../components/BottomBar.dart';

class BHomeScreen extends StatefulWidget {
  static const String id = "bhome_screen";
  const BHomeScreen({Key? key}) : super(key: key);

  @override
  State<BHomeScreen> createState() => _BHomeScreenState();
}

class _BHomeScreenState extends State<BHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbase,
        ////extendBodyBehindAppBar: true,
        appBar: AppBarHome(),
        body: Container(),
        endDrawer: EndDrawer(),
        bottomNavigationBar: BottomBar());
  }
}
