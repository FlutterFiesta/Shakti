import 'package:flutter/material.dart';
import 'package:power_she_pre/constants.dart';
import 'package:power_she_pre/myBody/bmain.dart';
import 'package:power_she_pre/screens/Tracker/TrackerPage.dart';
import 'package:power_she_pre/screens/home_screen.dart';
import 'package:power_she_pre/screens/map/location.dart';
import '../screens/opr_screen.dart';
//import '../screens/safety_screen.dart';
import '../screens/seller_buyer/store.dart';
import 'package:power_she_pre/screens/group_chat/groupsHomeScreen.dart';


class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomAppBar(
              clipBehavior: Clip.none,
              color: kbase,
              shape: CircularNotchedRectangle(),
              notchMargin: 10,
              child: Container(
                alignment: Alignment.center,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        Navigator.pushNamed(context, BHomeScreen.id);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.self_improvement_rounded,
                            color: kpink,
                            size: 20,
                          ),
                          Text(
                            'Self Care',
                            style: TextStyle(
                              color: kpink,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        //   currentScreen = HomeScreen();
                        //   currentTab = 0;
                        // });
                        Navigator.pushNamed(context, TrackerPage.id);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.water_drop,
                            color: kpink,
                            size: 20,
                          ),
                          Text(
                            'Tracker',
                            style: TextStyle(
                              color: kpink,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        Navigator.pushNamed(context, StoreScreen.id);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.storefront ,
                            color: kpink,
                            size: 20,
                          ),
                          Text(
                            'Store',
                            style: TextStyle(
                              color: kpink,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        Navigator.pushNamed(context, groupsHome.id);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.chat,
                            color: kpink,
                            size: 20,
                          ),
                          Text(
                            'Groups',
                            style: TextStyle(
                              color: kpink,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: <Widget>[
                    //     MaterialButton(
                    //       minWidth: 40,
                    //       onPressed: () {
                    //         Navigator.pushNamed(context, OprScreen.id);
                    //       },
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: const [
                    //           Icon(
                    //             Icons.school,
                    //             color: kpink,
                    //             size: 20,
                    //           ),
                    //           Text(
                    //             'Opportunities',
                    //             style: TextStyle(
                    //               color: kpink,
                    //               fontSize: 12,
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //     MaterialButton(
                    //       minWidth: 40,
                    //       onPressed: () {
                    //         Navigator.pushNamed(context, Location.id);
                    //       },
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: const [
                    //           Icon(
                    //             Icons.place,
                    //             color: kpink,
                    //             size: 20,
                    //           ),
                    //           Text(
                    //             'Location',
                    //             style: TextStyle(
                    //               color: kpink,
                    //               fontSize: 12,
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

