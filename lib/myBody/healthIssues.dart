import 'package:flutter/material.dart';
import 'package:power_she_pre/components/EndDrawer.dart';
import 'package:power_she_pre/constants.dart';
import 'package:power_she_pre/screens/ChatBotSupport/mainScreen.dart';
import '../components/AppBarHome.dart';
import '../components/BottomBar.dart';

class HealthIssues extends StatelessWidget {
  static const String id = "healthIssues";
  HealthIssues({Key? key}) : super(key: key);

  final List<String> health_issues = [
  "Heart Disease",
  "Breast Cancer",
  "Ovarian and Cervical Cancer",
  "Gynecological Health",
  "Pregnancy Issues",
  "Autoimmune Diseases",
  "Depression and Anxiety"
];

final List<dynamic> health_ans = [
  {
    "des":
        "The most common heart attack symptom in women is the same as in men – some type of chest pain, pressure or discomfort that lasts more than a few minutes or comes and goes. But chest pain is not always severe or even the most noticeable symptom, particularly in women. Women often describe it as pressure or tightness. And, it's possible to have a heart attack without chest pain.",
    "ans":
        "Quit smoking, Exercise regularly, Maintain a healthy weight, Eat a healthy diet, Manage your stress, Limit alcohol, Follow your treatment plan, Manage other health conditions.",
  },
  {
    "des":
        "Breast cancer can occur in women and rarely in men. Symptoms of breast cancer include a lump in the breast, bloody discharge from the nipple and changes in the shape or texture of the nipple or breast.",
    "ans":
        "Its treatment depends on the stage of cancer. It may consist of chemotherapy, radiation, hormone therapy and surgery."
  },
  {
    "des":
        "They occur in different parts of the female reproductive system: cervical cancer is found in the cervix, which is the narrow, lower part of the uterus where it connects to the upper end of the vagina; ovarian cancer originates in the fallopian tubes and occurs in the ovaries, which are reproductive organs on each side .",
    "ans":
        "Typically, it is treated by surgery, radiation therapy, chemotherapy, or a combination of treatments."
  },
  {
    "des":
        "Although irregular cycles or painful monthly cramps can be common issues affecting women, they are by no means something that women must adjust to as their norm. Many intervention methods, both surgical and medical, exist to relieve and in many cases cure symptoms of conditions ranging from menstrual disorders to urinary incontinence.",
    "ans":
        "Speak with your physician if you are experiencing especially painful cramps, severe abdominal pain, or heavy and/or prolonged bleeding between periods or during intercourse, as they could be signs of a more serious women's health issue."
  },
  {
    "des":
        "High blood pressure, gestational diabetes, preeclampsia, preterm labor, a loss of pregnancy, or miscarriage,etc.",
    "ans":
        "Eat small, frequent meals, Stay away from greasy or fried food, coffee, cola, and smoking, Eat slowly and chew your food well, and Don't lie down for at least half an hour after meals."
  },
  {
    "des":
        "In an autoimmune disease, the immune system mistakes part of your body, like your joints or skin, as foreign. It releases proteins called autoantibodies that attack healthy cells.Some autoimmune diseases target only one organ. Type 1 diabetes damages the pancreas. Other diseases, like systemic lupus erythematosus (SLE), affect the whole body.",
    "ans":
        "The right diet can help ease pain and heal autoimmune diseases. In general, avoid caffeine, alcohol, sugar, grains, dairy and red meat, and focus on fruits, vegetables, healthy fats and fish. Try these six foods to make living with autoimmune conditions easier."
  },
  {
    "des":
        "Depression and anxiety disorders are different, but people with depression often experience symptoms similar to those of an anxiety disorder, such as nervousness, irritability, and problems sleeping and concentrating. But each disorder has its own causes and its own emotional and behavioral symptoms.",
    "ans":
        "Shout it out. talking to a trusted friend is one way to cope with anxiety, get moving, break up with caffeine, give yourself a bedtime, feel OK saying no, don't skip meals, give yourself an exit strategy, live in the moment,etc."
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
                  child: Text('HEALTH ISSUES'))
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
            //     child: Text(
            //       "HEALTH ISSUES",
            //       style: TextStyle(
            //         fontWeight: FontWeight.w900,
            //         fontSize: 25,
            //       ),
            //     ),
            //   ),

            //   SizedBox(
            //     height: 10,
            //   ),

              Expanded(
                child: ListView(
                  children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          image: AssetImage('images/breastfeed.jpg'),
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                        ),
                      ),
              
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "While both men and women contract various conditions, some health issues affect women differently and more commonly. Furthermore, many women’s health conditions go undiagnosed and most drug trials do not include female test subjects. Even so, women bear exclusive health concerns, such as breast cancer, cervical cancer, menopause, and pregnancy. Women suffer higher heart attack deaths compared to men. ",
                        style: TextStyle(
                          height: 2.0,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
              
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 5.0,
                            shadowColor: Colors.grey[50],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: Icon(
                                  Icons.star,
                                  color: Colors.red[200],
                                ),
                                title: Text(
                                  health_issues[index],
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text('with solution'),
                                trailing: Text(
                                  'TAP',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                enabled: true,
                                onTap: () =>
                                    {_showDetails(context, index)},
                              ),
                            ),
                          );
                        },
                        itemCount: health_issues.length,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                      ),
                    
                  ]),
              ),
          ],
        ),
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

Future<void> _showDetails(
      BuildContext context, int index) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              health_issues[index],
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.red[300]),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    health_ans[index]["des"],
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Solution",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    health_ans[index]["ans"],
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[300],
                ),
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
