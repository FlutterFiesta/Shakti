import 'package:flutter/material.dart';
import 'package:flutter_slimy_card/flutter_slimy_card.dart';
import 'package:power_she_pre/components/EndDrawer.dart';
import 'package:power_she_pre/constants.dart';
import 'package:power_she_pre/screens/ChatBotSupport/mainScreen.dart';
// import 'package:slimy_card/slimy_card.dart';
import '../components/AppBarHome.dart';
import '../components/BottomBar.dart';

class Menstruation extends StatelessWidget {
  static const String id = "menstruation";
  Menstruation({Key? key}) : super(key: key);

  final List<dynamic> periods_que = [
  {
    "que": "When Do Most Girls Get Their Period?",
    "ans":
        "Most girls get their first period when they're around 12. But getting it any time between age 10 and 15 is OK. Every girl's body has its own schedule.",
  },
  {
    "que": "What Causes a Period?",
    "ans":
        "A period happens because of changes in hormones in the body. Hormones are chemical messengers. The ovaries release the female hormones estrogen and progesterone .",
  },
  {
    "que": "How Does Ovulation Relate to Periods?",
    "ans":
        "Ovulation is the release of an egg from the ovaries. The same hormones that cause the uterus lining to build up also cause an egg to leave one of the ovaries. The egg travels through a thin tube called a fallopian tube to the uterus.",
  },
  {
    "que": "Do Periods Happen Regularly When Menstruation Starts?",
    "ans":
        "For the first few years after a girl starts her period, it may not come regularly. This is normal at first. By about 2–3 years after her first period, a girl's periods should be coming around once every 4–5 weeks.",
  },
  {
    "que": "Can a Girl Get Pregnant as Soon as Her Period Starts?",
    "ans":
        "Yes, a girl can get pregnant as soon as her period starts. A girl can even get pregnant right before her very first period. This is because a girl's hormones might already be active.",
  },
  {
    "que": "How Long Do Periods Last?",
    "ans":
        "Periods usually last about 5 days. But a period can be shorter or last longer.",
  },
  {
    "que": "How Often Does a Period Happen?",
    "ans":
        "Periods usually happen about once every 4–5 weeks. But some girls get their periods a little less or more often.",
  },
  {
    "que": "How Much Blood Comes Out?",
    "ans":
        "It may look like a lot of blood, but a girl usually only loses a few tablespoons of blood during the whole period. Most girls need to change their pad, tampon, or menstrual cup about 3‒6 times a day.",
  },
  {
    "que": "Will I Have Periods for the Rest of My Life?",
    "ans":
        "When women reach menopause (around age 45‒55), their periods will permanently stop. Women also won't have a period while they are pregnant.",
  },
  {
    "que": "What Is PMS?",
    "ans":
        "PMS (premenstrual syndrome) is when a girl has emotional and physical symptoms that happen before or during her period. These symptoms can include moodiness, sadness, anxiety, bloating, and acne. The symptoms go away after the first few days of a period.",
  },
  {
    "que": "What Can I Do About Cramps?",
    "ans":
        "A warm heating pad on your belly, and taking ibuprofen (Advil, Motrin, or store brand) or naproxen (Aleve or store brand)",
  }
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Text('MENSTRUATION'))
            ],
          ),
        ),
      ),
    ),
      endDrawer: EndDrawer(),
      bottomNavigationBar: BottomBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
            // Center(
            //     child: Text(
            //       "MENSTRUATION",
            //       style: TextStyle(
            //         fontWeight: FontWeight.w900,
            //         fontSize: 25,
            //       ),
            //     ),
            //   ),

              

            // SizedBox(
            //     height: 10,
            // ),


             Expanded(
               child: ListView(
                children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image(
                    image: AssetImage('images/MensPeriod.jpg'),
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                ),
             
                SizedBox(
                  height: 10,
                ),
                
                Text(
                  "A period is a release of blood from a girl's uterus, out through her vagina. It is a sign that she is getting close to the end of puberty.",
                  style: TextStyle(
                    height: 2.0,
                  ),
                ),
             
                SizedBox(
                  height: 30,
                ),
             
                ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlutterSlimyCard(
                          // color: Colors.red[300],
                          topCardHeight: 200,
                          bottomCardHeight: 200,
                          slimeEnabled: true,
                          topCardWidget: Container(
                            width: double.infinity,
                            height: double.infinity,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Color(0xFF5D5172),
                            ),
                            child: Center(
                              child: Text(
                                periods_que[index]["que"],
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          bottomCardWidget: Container(
                            width: double.infinity,
                            height: double.infinity,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Color(0xFFFDD14F),
                            ),
                            child: Center(
                              child: Text(
                                periods_que[index]["ans"],
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: periods_que.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                  ),
             
                  SizedBox(height: 10),
             
                  Text(
                    "Periods are a natural, healthy part of a girl's life. They shouldn't get in the way of exercising, having fun, and enjoying life.",
                    style: TextStyle(
                      height: 2.0,
                    ),
                      ),
                     ]),
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
    );   
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