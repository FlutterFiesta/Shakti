import 'package:flutter/material.dart';
import 'package:power_she_pre/components/AppButton.dart';
import 'package:power_she_pre/components/EndDrawer.dart';
import 'package:power_she_pre/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../components/AlertBox.dart';
import 'package:power_she_pre/components/AppBarHome.dart';
import '../components/BottomBar.dart';
import 'package:sidebarx/sidebarx.dart';

class StoreScreen extends StatefulWidget {
  static const String id = "store_screen";
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedInUser;
  String userId='';
  late Stream<QuerySnapshot> selectedDoc;
  String userName='';
  bool spinner = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final user = _auth.currentUser;
    if (user != null) {
      setState(() {
        loggedInUser = user;
        userId = user.uid;
      });
      getDoc();
    }
    // print(_firestore
    //     .collection('store')
    //     .where('sell_id', isNotEqualTo: userId).snapshots());
  }
  void getDoc() async {
    final docref = await _firestore.collection("details").doc(userId).get();
    setState(() {
      userName = docref['Name'];
      // print(userName);
      // print(userId);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: klblue,
      appBar: AppBarHome(),
      endDrawer:EndDrawer(),
      bottomNavigationBar: BottomBar(),
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
                            .where('buy_id', isNotEqualTo: futureSnapshot.data)
                            .where('order_now', isEqualTo: false)
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
                                              0.6,
                                      child: Card(
                                        elevation: 10,
                                        shadowColor: Colors.black,
                                        color: kbase,
                                        child: SizedBox(
                                          // width: MediaQuery.of(context)
                                          //     .size
                                          //     .width *
                                          //     0.90,
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.6,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundColor: kdblue,
                                                      radius: 26,
                                                      child: CircleAvatar(
                                                        radius: 24,
                                                        backgroundImage:
                                                            AssetImage(
                                                                'images/Profile.png'),
                                                      ),
                                                    ),
                                                    // getName(documents[index]['sell_id'])
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15.0),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            documents[index]
                                                                ['product_name'],
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                          ),
                                                          SizedBox(height: 5,),
                                                          Text('Seller: '+
                                                            documents[index]
                                                            ['seller_name'],
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w200,
                                                              fontStyle: FontStyle.italic,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                          documents[index]
                                                              ['Bio']),
                                                    ),
                                                  ],
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  child: Container(

                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 230,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      image: DecorationImage(
                                                        fit: BoxFit.contain,
                                                        image: NetworkImage(
                                                            documents[index]
                                                                ['image']),
                                                      ),
                                                    ),
                                                  ), // Container(
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Text(
                                                        "₹" +
                                                            documents[index]
                                                                    ['price']
                                                                .toString(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: kdblue,
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                    MaterialButton(
                                                      onPressed: () async {
                                                        setState(() {
                                                          spinner = true;
                                                        });
                                                        await _firestore
                                                            .collection('store')
                                                            .doc(documents[index].id)
                                                            .update({
                                                          'order_now': true,
                                                          'buy_id':userId,
                                                          'buyer_name':userName,
                                                        });
                                                        setState(() {
                                                          spinner = false;
                                                        });
                                                      },
                                                      child: Text(documents[index]['order_now']?'Added':
                                                        'Buy Now',
                                                        style: TextStyle(
                                                            color: kbase),
                                                      ),
                                                      color:documents[index]['order_now']? Colors.grey:Colors.green,
                                                    )
                                                  ],
                                                ),
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

  // getName(String id) {
  //    final docref = await _firestore.collection("details").doc(id).get();
  //    print(docref['Name']);
  //    print(id);
  //
  //    return Text(
  //      ""
  //    );
  //  }
}
