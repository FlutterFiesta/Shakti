import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:power_she_pre/screens/Tracker/TrackerPage.dart';
import 'TrackerPage.dart';
class TrackerInfo extends StatefulWidget {
  static const String id="tracker_info";
  const TrackerInfo({Key? key}) : super(key: key);

  @override
  State<TrackerInfo> createState() => _TrackerInfoState();
}

class _TrackerInfoState extends State<TrackerInfo> {
  int  mLength = 1;
  int pLength = 28;
  final List<int>listItem =<int>[1,2,3,4,5,6,7,8,9];
  DateTime dt = DateTime.now();
  DateTime _dateTime=DateTime.now();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedInUser;
  String userId='';
  late Stream<QuerySnapshot> selectedDoc;
  bool spinner = false;
  var lastMenstruation= [DateTime.now()];

  @override
  void initState() {
    super.initState();
    setState(() {
      spinner=true;
    });
    final user = _auth.currentUser;
    if (user != null) {
      setState(() {
        loggedInUser = user;
        userId = user.uid;
      });
      getDoc();

    }
  }

  void getDoc() async {
    final docref = await _firestore.collection("users").doc(userId).get();
    setState(() {
        pLength=docref['periodLength'];
        mLength=docref['menstrualLength'];
        var newList=docref['lastMenstruation'];
        lastMenstruation=[];
        for(var i=0;i<newList.length;i++){
          var date = newList[i].toDate();
          lastMenstruation.add(date);
        }
        spinner=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        progressIndicator: const CircularProgressIndicator(
          color:Colors.pink,
        ),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Update Menstrual Details', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Divider(
                    color: HexColor("#734acc"),
                    height: 10,
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: HexColor("#734acc"), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Menstrual Length",style: TextStyle(fontSize: 20),),

                        DropdownButton(
                          style: TextStyle(color: Colors.black),
                          // dropdownColor: Colors.purpleAccent[100],
                          isDense: false,
                          hint: Text('Select value'),
                          value: mLength,
                          onChanged: (newValue) {
                            setState(() {
                              mLength = newValue! ;
                            });
                          },
                          items: listItem.map((valueItem){
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text("$valueItem days",),
                            );
                          }).toList(),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Card(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color:HexColor("#734acc"), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Period Length",style: TextStyle(fontSize: 20),),

                        DropdownButton(
                          hint: Text('Select value'),
                          value: pLength,
                          onChanged: (newValue) {
                            setState(() {
                              pLength = newValue!;
                            });
                          },
                          items: List.generate(10, (index) {
                            var new_val=index+25;
                            return DropdownMenuItem(
                              value: new_val,
                              child: Text("$new_val days",),
                            );
                          }).toList(),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: HexColor("#734acc"), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Last Menstruation:",style: TextStyle(fontSize: 20),),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 244, 13, 179),

                            ),
                            child: Text(_dateTime == null ? '${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}': '${_dateTime.day.toString()}/${_dateTime.month.toString()}/${_dateTime.year.toString()}'),
                            onPressed: (){
                              showDatePicker(
                                  context: context,
                                  initialDate: _dateTime == null ?  DateTime.now() : _dateTime,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2030)
                              ).then((date) {
                                setState(() {
                                  _dateTime = date!;
                                });
                              });
                            }),
                      ],
                    ),

                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 244, 13, 179),

                  ),
                  onPressed: () {
                    print(pLength);
                    print(mLength);
                    lastMenstruation.add(_dateTime);
                    print(lastMenstruation);
                    setState(() {
                      spinner=true;
                    });
                    print(lastMenstruation);
                    _firestore
                        .collection(
                        'users')
                        .doc(
                        userId)
                        .update({
                      'periodLength': pLength,
                      'menstrualLength':mLength,
                      'lastMenstruation':lastMenstruation
                    });

                    setState(() {
                      spinner=false;
                    });
                    Navigator.pushNamed(context, TrackerPage.id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('  Save Changes  ', style: TextStyle(fontSize: 20),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
