import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../components/AppBarHome.dart';
import '../../components/BottomBar.dart';
import '../../components/EndDrawer.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class TrackerPage extends StatefulWidget {
  static const String id="tracker_screen";
  const TrackerPage({Key? key}) : super(key: key);

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.utc(2023, 02, 10);
  DateTime _selectedDay=DateTime.now();
  int periodLength= 28;
  int menstrualLength=5;
  var lastMenstruation= [DateTime.now()];
  int color=-1;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedInUser;
  String userId='';
  late Stream<QuerySnapshot> selectedDoc;
  String userName='';
  bool spinner = false;

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
      if(!docref.data()!.containsKey('periodLength')){
        print("Hello");
      }
      userName = docref['fullName'];
      spinner=false;
    });
    print(userId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome(),
      endDrawer:EndDrawer(),
      bottomNavigationBar: BottomBar(),
      body:ModalProgressHUD(
        inAsyncCall: spinner,
        progressIndicator: CircularProgressIndicator(
          color:Colors.pink,
        ),
        child: SafeArea(
    child: SingleChildScrollView(

    child: Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Padding(
    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 0.0, bottom: 0),
    child: TableCalendar(
    calendarStyle: CalendarStyle(
    isTodayHighlighted: true,
    ),
    calendarBuilders: CalendarBuilders(
    markerBuilder: (context,date,event){
    if(event.isNotEmpty) {
    color++;
    int a = 1, b = 1;
    if(color == 0)
    {
    a = 300;
    b = 300;
    }
    else if(color == 1)
    {
    a = 300;
    b = 200;
    }
    else if(color == 2)
    {
    a = 300;
    b = 100;
    }
    else if(color == 3)
    {
    a = 300;
    b = 50;
    }
    else if(color == 4)
    {
    a = 200;
    b = 50;
    }
    else if(color == 5)
    {
    a = 100;
    b = 50;
    }
    else
    {
    a = 50;
    b = 50;
    }
    // int s = (code-f)%4;
    return Container(
    decoration:BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    gradient: LinearGradient(
    colors: [
    Color.fromRGBO(115, 74, 204, 1),
    Color.fromARGB(255, 244, 13, 179),
    ]
    )
    ),
    margin: const EdgeInsets.all(4.0),
    alignment: Alignment.center,
    child: Text(
    date.day.toString(),
    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
    ));
    }
    color=-1;
    return Container();
    },
    todayBuilder: (context, date, events) => Container(
    margin: const EdgeInsets.all(4.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
    color:  Color.fromARGB(255, 244, 13, 179),
    borderRadius: BorderRadius.circular(30)),
    child: Text(
    date.day.toString(),
    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
    )),

    ),
    firstDay: DateTime.utc(2019, 10, 16),
    lastDay: DateTime.now().add(Duration(days: 1000)),
    focusedDay:_focusedDay,
    calendarFormat: _calendarFormat,
    eventLoader: (day){
    if(lastMenstruation.length != 0 && periodLength!=0 && menstrualLength!=0) {
    DateTime dt = lastMenstruation[lastMenstruation.length-1].subtract(Duration(days:menstrualLength-1));
    dt = dt.add(Duration(days:periodLength));
    List<DateTime>dts = [];
    while (dt.isBefore(DateTime.now().add(Duration(days: 900)))) {
    dts.add(dt);
    for(int i=1;i<menstrualLength;++i){
    dts.add(dts[dts.length-1].add(Duration(days: 1)));
    }
    dt = dt.add(Duration(days: periodLength));
    }
    dynamic st = [];
    for (DateTime time in dts) {
    if (day.day == time.day && day.month == time.month &&
    day.year == time.year) {
    st.add("next period date");
    }
    }

    return st;
    }
    return [];
    },
    selectedDayPredicate: (day) {
    return isSameDay(_selectedDay, day);
    },
    onDaySelected: (selectedDay, focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
    setState(() {
    _selectedDay = selectedDay;
    _focusedDay = focusedDay;
    });
    }
    },
    onPageChanged: (focusedDay) {
    _focusedDay = focusedDay;
    },
    ),
    ),
    Padding(
    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [

    Padding(
    padding: EdgeInsets.only(left: 15.0, right: 20.0, top: 8.0, bottom: 8.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text("Menstrual Length :",style: TextStyle(fontSize: 20,
    ),
    ),
    Spacer(flex:3,),
    Card(child: Container(
    decoration:BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    gradient: LinearGradient(
    colors: [

    Color.fromRGBO(115, 74, 204, 1),
    Color.fromARGB(255, 244, 13, 179),
    ]
    )
    ),
    child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
    child: Text("${menstrualLength} days",style: TextStyle(fontSize: 20,
    fontFamily: 'FredokaOne',color: Color.fromARGB(255, 255, 255, 255), ),),
    ),
    )),
    ],
    ),
    ),
    Padding(
    padding: EdgeInsets.only(left: 15.0, right: 20.0, top: 8.0, bottom: 8.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text('Period Length :',style: TextStyle(fontSize: 20),),
    Spacer(flex:3,),
    Card(child: Container(
    decoration:BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    gradient: LinearGradient(
    colors: [


    Color.fromRGBO(115, 74, 204, 1),
    Color.fromARGB(255, 244, 13, 179),

    ]
    )
    ),
    child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
    child: Text("${periodLength} days",style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255), ),),
    ),
    )),

    ],
    ),
    ),
    Padding(
    padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 8.0, bottom: 8.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text("Last Menstruation :",style: TextStyle(fontSize: 20),),
    Spacer(flex:3,),
    Card(child: Container(
    decoration:BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    gradient: LinearGradient(
    colors: [
    Color.fromRGBO(115, 74, 204, 1),
    Color.fromARGB(255, 244, 13, 179),

    ]
    )
    ),
    child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
    child: Text(lastMenstruation.length==0?" ":'${lastMenstruation[lastMenstruation.length-1].day.toString()}/${lastMenstruation[lastMenstruation.length-1].month.toString()}/${lastMenstruation[lastMenstruation.length-1].year.toString()}',
    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255), ),),
    ),
    )),
    ],
    ),
    ),
    ],
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
