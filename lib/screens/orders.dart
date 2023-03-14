import 'package:flutter/material.dart';
import 'package:power_she_pre/components/AppBarHome.dart';
import 'package:power_she_pre/components/AppButton.dart';
import 'package:power_she_pre/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/AlertBox.dart';

class OrderScreen extends StatefulWidget {
  static const String id = "order_screen";
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedInUser;
  String userId='';
  late Stream<QuerySnapshot> selectedDoc;
  String userName='';
  bool spinner = false;
  int currVal=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    super.initState();
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
    final docref = await _firestore.collection("details").doc(userId).get();
    setState(() {
      userName = docref['Name'];
      print(userName);
      print(userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: klblue,
      appBar: AppBarHome(),
      bottomNavigationBar: BottomAppBar(),
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        progressIndicator: const CircularProgressIndicator(
          color: kpink,
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                FutureBuilder(
                  future: Future.value(_auth.currentUser!.uid),
                  builder: (context, futureSnapshot) {
                    if (futureSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 1.3,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: kpink,
                          ),
                        ),
                      );
                    }
                    // print(futureSnapshot.data);
                    return StreamBuilder<QuerySnapshot>(

                      // <2> Pass `Stream<QuerySnapshot>` to stream
                        stream: _firestore
                            .collection('store')
                            .where('buy_id', isEqualTo: futureSnapshot.data)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            // <3> Retrieve `List<DocumentSnapshot>` from snapshot
                            final List<DocumentSnapshot> documents =
                                snapshot.data!.docs;
                            // print(documents.length);

                            return SingleChildScrollView(
                              child: ListView.builder(
                                // physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: documents.length,
                                  itemBuilder: (context, index) {
                                    // print(documents[index].id);
                                    return SizedBox(
                                      width: double.infinity,
                                      height:
                                      MediaQuery.of(context).size.height *
                                          0.2,
                                      child: Card(
                                        elevation: 10,
                                        shadowColor: Colors.black,
                                        color: kbase,
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.2,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              children: [
                                                Container(height: 100,width: 100,
                                                decoration: BoxDecoration(
                                                  image:DecorationImage(image:NetworkImage(documents[index]['image']),fit: BoxFit.fill)
                                                ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Column(

                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(documents[index]['product_name'],style:TextStyle(fontSize: 18)),
                                                      Text(
                                                          "₹"+documents[index]['price'].toString(),
                                                          style:TextStyle(fontStyle: FontStyle.italic)
                                                      ),
                                                        Row(
                                                          children: [
                                                            TextButton(
                                                              onPressed: () {},
                                                              child: Container(
                                                                color: getColor(documents[index]['order_now'],documents[index]['confirm'],documents[index]['delivered']),
                                                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                                                child: Text(
                                                                  getText(documents[index]['order_now'],documents[index]['confirm'],documents[index]['delivered']),
                                                                  style: TextStyle(color: Colors.white, fontSize: 13.0),
                                                                ),
                                                              ),
                                                            ),

                                                            TextButton(
                                                              onPressed: () async{


                                                                final docref = await _firestore.collection("details").doc(documents[index]['sell_id']).get();
                                                                String email=docref['Email'];
                                                                String phone=docref['Phone'];
                                                                print(email+" "+phone);

                                                                showDialog<void>(
                                                                  context: context,
                                                                  barrierDismissible:
                                                                  false,
                                                                  builder: (BuildContext
                                                                  context) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          "Details of the seller"),
                                                                      content:
                                                                      SingleChildScrollView(
                                                                        child: ListBody(
                                                                          children: <
                                                                              Widget>[
                                                                            Text(
                                                                                'Email: \n'+email+'\n\n'+"Phone: \n"+phone),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      actions: <Widget>[
                                                                        TextButton(
                                                                          child:
                                                                          const Text(
                                                                            'Ok',
                                                                            style:
                                                                            TextStyle(
                                                                              fontSize:
                                                                              18,
                                                                              color:
                                                                              kpink,
                                                                            ),
                                                                          ),
                                                                          onPressed:
                                                                              ()  {
                                                                            Navigator.of(
                                                                                context)
                                                                                .pop();

                                                                          },
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                // setState(() {
                                                                //   spinner = false;//
                                                                // });
                                                              },
                                                              child: Container(
                                                                color: kdblue,
                                                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                                                child: const Text(
                                                                  'Contact',
                                                                  style: TextStyle(color: Colors.white, fontSize: 13.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )

                                                    ],)
                                                  ],
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    // mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          if(documents[index]['confirm']){
                                                            showDialog<void>(
                                                              context: context,
                                                              barrierDismissible:
                                                              false, // user must tap button!
                                                              builder: (BuildContext
                                                              context) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'You cannot cancel the product now'),
                                                                  content:
                                                                  SingleChildScrollView(
                                                                    child: ListBody(
                                                                      children: const <
                                                                          Widget>[
                                                                        Text(
                                                                            'Please file a return once the product reaches you'),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  actions: <Widget>[
                                                                    TextButton(
                                                                      child:
                                                                      const Text(
                                                                        'Ok',
                                                                        style:
                                                                        TextStyle(
                                                                          fontSize:
                                                                          18,
                                                                          color:
                                                                          kpink,
                                                                        ),
                                                                      ),
                                                                      onPressed:
                                                                          ()  {
                                                                        Navigator.of(
                                                                            context)
                                                                            .pop();

                                                                      },
                                                                    ),
                                                                  ],
                                                                );
                                                                ;
                                                              },
                                                            );
                                                          }else {
                                                            showDialog<void>(
                                                              context: context,
                                                              barrierDismissible:
                                                              false,
                                                              // user must tap button!
                                                              builder: (
                                                                  BuildContext
                                                                  context) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Are you sure you want to unorder this product?'),
                                                                  content:
                                                                  SingleChildScrollView(
                                                                    child: ListBody(
                                                                      children: const <
                                                                          Widget>[
                                                                        Text(
                                                                            'You can delete only until the order is unconfirmed'),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  actions: <
                                                                      Widget>[
                                                                    TextButton(
                                                                      child:
                                                                      const Text(
                                                                        'Yes',
                                                                        style:
                                                                        TextStyle(
                                                                          fontSize:
                                                                          18,
                                                                          color:
                                                                          kpink,
                                                                        ),
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        Navigator
                                                                            .of(
                                                                            context)
                                                                            .pop();
                                                                        setState(
                                                                                () {
                                                                              spinner =
                                                                              true;
                                                                            });
                                                                        await _firestore
                                                                            .collection(
                                                                            'store')
                                                                            .doc(
                                                                            documents[index]
                                                                                .id)
                                                                            .update(
                                                                            {
                                                                              'order_now': false,
                                                                              'buy_id': "",
                                                                              'buyer_name': "",
                                                                            });
                                                                        setState(
                                                                                () {
                                                                              spinner =
                                                                              false;
                                                                            });
                                                                      },
                                                                    ),
                                                                  ],
                                                                );
                                                                ;
                                                              },
                                                            );
                                                          }
                                                        },
                                                        child: Icon(
                                                          Icons.delete,
                                                          size: 18,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          } else if (snapshot.hasError) {
                            return Text('It\'s Error!');
                          } else {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height / 1.3,
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: kpink,
                                ),
                              ),
                            );
                          }
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getText(bool o, bool c, bool d) {
    if(d){
      return 'delivered';
    }else if(c){
      return 'confirmed';
    }else{
      return 'ordered';
    }
  }
}

Color getColor(bool o, bool c, bool d){
  if(d){
    return Colors.green;
  }else if(c){
    return Colors.orange;
  }else{
    return Colors.grey;
  }
}



