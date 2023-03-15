import 'package:flutter/material.dart';
import 'package:power_she_pre/components/EndDrawer.dart';
import 'package:power_she_pre/constants.dart';
import 'package:power_she_pre/myBody/healthIssues.dart';
import 'package:power_she_pre/myBody/menstruation.dart';
import 'package:power_she_pre/myBody/products.dart';

import '../components/AppBarHome.dart';
import '../components/BottomBar.dart';
import 'package:power_she_pre/myBody/puberty.dart';

class BHomeScreen extends StatefulWidget {
  static const String id = "bhome_screen";
  const BHomeScreen({Key? key}) : super(key: key);

  @override
  State<BHomeScreen> createState() => _BHomeScreenState();
}

class _BHomeScreenState extends State<BHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: kbase,
          ////extendBodyBehindAppBar: true,
          appBar: AppBarHome(heading: 'Self Care'),
          body: Center(
            child: ListView(
              padding: const EdgeInsets.all(30),
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Card(
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20.0),
                //   ),
                //   // color: Color.fromARGB(255, 244, 220, 164),
                //   child: SizedBox(
                //     width: 350,
                //     height: 200,
                //     child: Stack(
                //       alignment: Alignment.bottomCenter,
                //       children: <Widget>[
                //           FittedBox(
                //             child: Image.asset('images/Puberty.jpg'),
                //             fit: BoxFit.fill,
                //           ),
                //           Text("Puberty"),
                //       ]
                //     ),
                //   ),
                // ),
                
                GestureDetector(
                  onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Puberty()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    // color: Color.fromARGB(255, 244, 220, 164),
                    child: SizedBox(
                      width: 300,
                      height: 200,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset('images/Puberty.jpg', fit: BoxFit.cover),
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0),
                                ),
                                color: Color.fromARGB(255, 219, 206, 206).withOpacity(0.5),
                              ),
                              child: Center(
                                child: Text(
                                  "Puberty",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                        ]
                      ),
                    ),
                  ),
                ),
    
                GestureDetector(
                  onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Menstruation()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    // color: Color.fromARGB(255, 244, 220, 164),
                    child: SizedBox(
                      width: 300,
                      height: 200,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset('images/Menstruation.jpeg'),
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0),
                                ),
                                color: Color.fromARGB(255, 219, 206, 206).withOpacity(0.5),
                              ),
                              child: Center(
                                child: Text(
                                  "Menstruation",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                        ]
                      ),
                    ),
                  ),
                ),
    
                GestureDetector(
                  onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HealthIssues()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Color.fromARGB(255, 248, 228, 189),
                    child: SizedBox(
                      width: 300,
                      height: 200,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset('images/HealthIssues.jpg', height: double.infinity, width: double.infinity),
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0),
                                ),
                                color: Color.fromARGB(255, 219, 206, 206).withOpacity(0.5),
                              ),
                              child: Center(
                                child: Text(
                                  "Health Issues",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                        ]
                      ),
                    ),
                  ),
                ),
    
                GestureDetector(
                  onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Products()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    // color: Color.fromARGB(255, 244, 220, 164),
                    child: SizedBox(
                      width: 300,
                      height: 200,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset('images/Products.jpg', height: 200,),
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0),
                                ),
                                color: Color.fromARGB(255, 219, 206, 206).withOpacity(0.5),
                              ),
                              child: Center(
                                child: Text(
                                  "Products",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                        ]
                      ),
                    ),
                  ),
                ),
              ],),
          ),
          endDrawer: EndDrawer(),
          bottomNavigationBar: BottomBar(),
        ),
    );
  }
}
