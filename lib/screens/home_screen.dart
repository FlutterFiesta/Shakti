import 'package:flutter/material.dart';
import 'package:power_she_pre/components/EndDrawer.dart';
import 'package:power_she_pre/constants.dart';
import 'package:power_she_pre/screens/my_products.dart';
import 'package:power_she_pre/screens/splash.dart';
import 'package:power_she_pre/screens/store.dart';
import 'dart:async';
import 'package:power_she_pre/screens/welcome_screen.dart';
import 'package:sidebarx/sidebarx.dart';
import '../components/AppBarHome.dart';
import '../components/appBarInit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../components/BottomBar.dart';
import 'orders.dart';

import 'package:power_she_pre/screens/opr_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<YoutubePlayerController> _business = [
    'ysM3Qbw_pMo',
    '3soVHA-f1zQ',
    '8eTF7OOrxDM',
    'ivqXzw9imXo',
    'iUo8QX2Pjj4',
    'sgsSd2FghyU',
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        ),
      )
      .toList();

  final List<String> _businessTitle = [
    '3 Business Fundamentals',
    'Complete Knowledge of Business in 10 steps',
    'How to Improve Business Skills?',
    '15 Business Ideas For Women 2022',
    'Top 10 business ideas for women at home',
    '9 Business Ideas for Women',
  ];

  final List<YoutubePlayerController> _safety = [
    'MCFWoJSVgH4',
    'Ww1DeUSC94o',
    'J9lZ9OHdahg',
    'scvi2EemtDw',
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        ),
      )
      .toList();

  final List<String> _safetyTitle = [
    'Safety tips for Women',
    '30 EASY SELF-DEFENSE TIPS',
    '5 things women can use for safety',
    'Make Your City Safe | Women Safety Video',
  ];

  final List<YoutubePlayerController> _health = [
    'E4EaRk6r_SM',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        ),
      )
      .toList();

  final List<String> _healthTitle = [
    'Health Tips for Women',
    '2',
    '3',
    '4',
  ];

  final List<YoutubePlayerController> _personality = [
    'qS4ViqnjkC8',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        ),
      )
      .toList();

  final List<String> _personalityTitle = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];

  final List<YoutubePlayerController> _parenting = [
    'qS4ViqnjkC8',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        ),
      )
      .toList();

  final List<String> _parentingTitle = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];

  final List<YoutubePlayerController> _finance = [
    'qS4ViqnjkC8',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        ),
      )
      .toList();

  final List<String> _financeTitle = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];

  final List<YoutubePlayerController> _empower = [
    'qS4ViqnjkC8',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        ),
      )
      .toList();

  final List<String> _empowerTitle = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbase,
        ////extendBodyBehindAppBar: true,
        appBar: AppBarHome(),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              ExpansionTile(
                  title: Text("Business"),
                  leading: Icon(Icons.business_rounded), //add icon
                  //childrenPadding: EdgeInsets.only(left:10), //children padding
                  children: [
                    SizedBox(
                      height: 550,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              elevation: 10,
                              shadowColor: Colors.black,
                              color: Colors.white,
                              child: SizedBox(
                                width: 200,
                                //height: 360,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      //CircleAvatar
                                      //SizedBox
                                      //Text
                                      SizedBox(
                                        height: 10,
                                      ),

                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 200,
                                          child: YoutubePlayer(
                                            key: ObjectKey(_business[index]),
                                            controller: _business[index],
                                            actionsPadding:
                                                const EdgeInsets.only(
                                                    left: 16.0),
                                            bottomActions: [
                                              CurrentPosition(),
                                              const SizedBox(width: 10.0),
                                              ProgressBar(isExpanded: true),
                                              const SizedBox(width: 10.0),
                                              RemainingDuration(),
                                              FullScreenButton(),
                                            ],
                                          ),
                                        ), // Container
                                      ), //Text
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 6),
                                            child: Text(
                                              _businessTitle[index],
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontFamily: 'Lustria',
                                                  color: kdblue,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    ],
                                  ), //Column
                                ), //Padding
                              ),
                            ),
                          );
                        },
                        itemCount: _business.length,
                        separatorBuilder: (context, _) =>
                            const SizedBox(height: 1.0),
                      ),
                    ),
                  ]),
              ExpansionTile(
                  title: Text("Safety"),
                  leading: Icon(Icons.safety_check_rounded), //add icon
                  //childrenPadding: EdgeInsets.only(left:10), //children padding
                  children: [
                    SizedBox(
                      height: 550,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              elevation: 10,
                              shadowColor: Colors.black,
                              color: Colors.white,
                              child: SizedBox(
                                width: 200,
                                // height: 360,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),

                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 150,
                                          child: YoutubePlayer(
                                            key: ObjectKey(_safety[index]),
                                            controller: _safety[index],
                                            actionsPadding:
                                                const EdgeInsets.only(
                                                    left: 16.0),
                                            bottomActions: [
                                              CurrentPosition(),
                                              const SizedBox(width: 10.0),
                                              ProgressBar(isExpanded: true),
                                              const SizedBox(width: 10.0),
                                              RemainingDuration(),
                                              FullScreenButton(),
                                            ],
                                          ),
                                        ), // Container
                                      ), //Text
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 6),
                                            child: Text(
                                              _safetyTitle[index],
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontFamily: 'Lustria',
                                                  color: kdblue,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    ],
                                  ), //Column
                                ), //Padding
                              ),
                            ),
                          );
                        },
                        itemCount: _safety.length,
                        separatorBuilder: (context, _) =>
                            const SizedBox(height: 1.0),
                      ),
                    ),
                  ]),
              ExpansionTile(
                  title: Text("Health"),
                  leading: Icon(Icons.health_and_safety_rounded ), //add icon
                  //childrenPadding: EdgeInsets.only(left:10), //children padding
                  children: [
                    SizedBox(
                      height: 550,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              elevation: 10,
                              shadowColor: Colors.black,
                              color: Colors.white,
                              child: SizedBox(
                                width: 200,
                                // height: 360,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),

                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 150,
                                          child: YoutubePlayer(
                                            key: ObjectKey(_health[index]),
                                            controller: _health[index],
                                            actionsPadding:
                                                const EdgeInsets.only(
                                                    left: 16.0),
                                            bottomActions: [
                                              CurrentPosition(),
                                              const SizedBox(width: 10.0),
                                              ProgressBar(isExpanded: true),
                                              const SizedBox(width: 10.0),
                                              RemainingDuration(),
                                              FullScreenButton(),
                                            ],
                                          ),
                                        ), // Container
                                      ), //Text
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 6),
                                            child: Text(
                                              _healthTitle[index],
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontFamily: 'Lustria',
                                                  color: kdblue,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    ],
                                  ), //Column
                                ), //Padding
                              ),
                            ),
                          );
                        },
                        itemCount: _health.length,
                        separatorBuilder: (context, _) =>
                            const SizedBox(height: 1.0),
                      ),
                    ),
                  ]),
              ExpansionTile(
                  title: Text("Personality"),
                  leading: Icon(Icons.person_rounded), //add icon
                  //childrenPadding: EdgeInsets.only(left:10), //children padding
                  children: [
                    SizedBox(
                      height: 550,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              elevation: 10,
                              shadowColor: Colors.black,
                              color: Colors.white,
                              child: SizedBox(
                                width: 200,
                                // height: 360,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      //CircleAvatar
                                      //SizedBox
                                      //Text
                                      SizedBox(
                                        height: 10,
                                      ),

                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 150,
                                          child: YoutubePlayer(
                                            key: ObjectKey(_personality[index]),
                                            controller: _personality[index],
                                            actionsPadding:
                                                const EdgeInsets.only(
                                                    left: 16.0),
                                            bottomActions: [
                                              CurrentPosition(),
                                              const SizedBox(width: 10.0),
                                              ProgressBar(isExpanded: true),
                                              const SizedBox(width: 10.0),
                                              RemainingDuration(),
                                              FullScreenButton(),
                                            ],
                                          ),
                                        ), // Container
                                      ), //Text
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 6),
                                            child: Text(
                                              _personalityTitle[index],
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontFamily: 'Lustria',
                                                  color: kdblue,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    ],
                                  ), //Column
                                ), //Padding
                              ),
                            ),
                          );
                        },
                        itemCount: _personality.length,
                        separatorBuilder: (context, _) =>
                            const SizedBox(height: 1.0),
                      ),
                    ),
                  ]),
              ExpansionTile(
                  title: Text("Parenting"),
                  leading: Icon(Icons.home), //add icon
                  //childrenPadding: EdgeInsets.only(left:10), //children padding
                  children: [
                    SizedBox(
                      height: 550,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              elevation: 10,
                              shadowColor: Colors.black,
                              color: Colors.white,
                              child: SizedBox(
                                width: 200,
                                // height: 360,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      //CircleAvatar
                                      //SizedBox
                                      //Text
                                      SizedBox(
                                        height: 10,
                                      ),

                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 150,
                                          child: YoutubePlayer(
                                            key: ObjectKey(_parenting[index]),
                                            controller: _parenting[index],
                                            actionsPadding:
                                                const EdgeInsets.only(
                                                    left: 16.0),
                                            bottomActions: [
                                              CurrentPosition(),
                                              const SizedBox(width: 10.0),
                                              ProgressBar(isExpanded: true),
                                              const SizedBox(width: 10.0),
                                              RemainingDuration(),
                                              FullScreenButton(),
                                            ],
                                          ),
                                        ), // Container
                                      ), //Text
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 6),
                                            child: Text(
                                              _parentingTitle[index],
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontFamily: 'Lustria',
                                                  color: kdblue,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    ],
                                  ), //Column
                                ), //Padding
                              ),
                            ),
                          );
                        },
                        itemCount: _parenting.length,
                        separatorBuilder: (context, _) =>
                            const SizedBox(height: 1.0),
                      ),
                    ),
                  ]),
              ExpansionTile(
                  title: Text("Financial Management"),
                  leading: Icon(Icons.attach_money_rounded), //add icon
                  //childrenPadding: EdgeInsets.only(left:10), //children padding
                  children: [
                    SizedBox(
                      height: 550,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              elevation: 10,
                              shadowColor: Colors.black,
                              color: Colors.white,
                              child: SizedBox(
                                width: 200,
                                // height: 360,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      //CircleAvatar
                                      //SizedBox
                                      //Text
                                      SizedBox(
                                        height: 10,
                                      ),

                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 150,
                                          child: YoutubePlayer(
                                            key: ObjectKey(_finance[index]),
                                            controller: _finance[index],
                                            actionsPadding:
                                                const EdgeInsets.only(
                                                    left: 16.0),
                                            bottomActions: [
                                              CurrentPosition(),
                                              const SizedBox(width: 10.0),
                                              ProgressBar(isExpanded: true),
                                              const SizedBox(width: 10.0),
                                              RemainingDuration(),
                                              FullScreenButton(),
                                            ],
                                          ),
                                        ), // Container
                                      ), //Text
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 6),
                                            child: Text(
                                              _financeTitle[index],
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontFamily: 'Lustria',
                                                  color: kdblue,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    ],
                                  ), //Column
                                ), //Padding
                              ),
                            ),
                          );
                        },
                        itemCount: _finance.length,
                        separatorBuilder: (context, _) =>
                            const SizedBox(height: 1.0),
                      ),
                    ),
                  ]),
              ExpansionTile(
                  title: Text("Women Empowerment"),
                  leading: Icon(Icons.female_rounded), //add icon
                  //childrenPadding: EdgeInsets.only(left:10), //children padding
                  children: [
                    SizedBox(
                      height: 550,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              elevation: 10,
                              shadowColor: Colors.black,
                              color: Colors.white,
                              child: SizedBox(
                                width: 200,
                                // height: 360,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      //CircleAvatar
                                      //SizedBox
                                      //Text
                                      SizedBox(
                                        height: 10,
                                      ),

                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 150,
                                          child: YoutubePlayer(
                                            key: ObjectKey(_empower[index]),
                                            controller: _empower[index],
                                            actionsPadding:
                                                const EdgeInsets.only(
                                                    left: 16.0),
                                            bottomActions: [
                                              CurrentPosition(),
                                              const SizedBox(width: 10.0),
                                              ProgressBar(isExpanded: true),
                                              const SizedBox(width: 10.0),
                                              RemainingDuration(),
                                              FullScreenButton(),
                                            ],
                                          ),
                                        ), // Container
                                      ), //Text
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 6),
                                            child: Text(
                                              _empowerTitle[index],
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontFamily: 'Lustria',
                                                  color: kdblue,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    ],
                                  ), //Column
                                ), //Padding
                              ),
                            ),
                          );
                        },
                        itemCount: _empower.length,
                        separatorBuilder: (context, _) =>
                            const SizedBox(height: 1.0),
                      ),
                    ),
                  ]),
            ],
          )),
        ),
        endDrawer: EndDrawer(),
        // endDrawer: EndDrawer(),//
        bottomNavigationBar: BottomBar());
  }




}
