import 'package:flutter/material.dart';
import 'package:power_she_pre/components/EndDrawer.dart';
import 'package:power_she_pre/components/orgCard.dart';
import 'package:power_she_pre/constants.dart';
import 'package:power_she_pre/screens/ChatBotSupport/mainScreen.dart';
import '../components/AppBarHome.dart';
import '../components/BottomBar.dart';

class Org extends StatelessWidget {
  static const String id = "org";
  Org({Key? key}) : super(key: key);

  final List<dynamic> orgList = [
  {"url":"https://www.unwomen.org/en",
   "mainText": "UN Women",
   "location" : "Headquartered at the United Nations in New York",
   "subText" : "The United Nations Entity for Gender Equality and the Empowerment of Women (UN Women) is the UN agency dedicated to gender equality."}, 
   {
    "url":"https://www.hofna.org/#:~:text=HOFNA%20is%20a%20not%2Dfor,%2D%20learn%20more%20%2D",
   "mainText": "Hope for needy association (HOFNA)",
   "location" : "Ghana Street Nkwen, Bamenda",
   "subText" : "HOFNA is a not-for-profit organization with a mission to strengthen the leadership, power, and voices of susceptible women and girls from disadvantaged communities and develop them into self-reliant and socially conscious leaders."},
   ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
      backgroundColor: kpink,
      title: Padding(
        padding: const EdgeInsets.only(right: 0),
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
                  padding: const EdgeInsets.all(8.0),
                  child: Text("NGOs", style: TextStyle(fontSize:17),))
            ],
          ),
        ),
      ),
    ),
      endDrawer: EndDrawer(),
      bottomNavigationBar: BottomBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [

              // Center(
              //       child: Text(
              //         "NON-GOVERNMENTAL ORGANIZATIONS",
              //         style: TextStyle(
              //           fontWeight: FontWeight.w900,
              //           fontSize: 25,
              //         ),
              //         textAlign: TextAlign.center,
              //       ),
              //     ),

              // SizedBox(
              //   height: 10,
              // ),

              Text(
                    "Here are a curated list of Organizations you can reach out to if you need help.",
                    textAlign: TextAlign.center,
              ),
            
            SizedBox(
              height: 10,
            ),
            Expanded(
            child: orgList.length == 0 ?
            Center(
              child: CircularProgressIndicator(),
            ) :
            ListView.builder(
              itemCount: orgList.length,
              itemBuilder: (context, index) {
              return OrgCard(url: orgList[index]["url"], mainText: orgList[index]["mainText"], subText: orgList[index]["subText"], location: orgList[index]["location"],);
            })
          ),

        ],),
      ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              popUpDialog(context);
            },
            elevation: 0,
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(
              Icons.chat_bubble,
              color: Colors.white,
              size: 30,
            ),
          )
    ));
  }

  popUpDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: ((context, setState) {
            return mainChatScreen();
          }));
        });
  }
}