
import 'package:flutter/material.dart';
import 'package:power_she_pre/components/AppButton.dart';
import 'package:power_she_pre/components/EndDrawer.dart';
import 'package:power_she_pre/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:power_she_pre/screens/ChatBotSupport/mainScreen.dart';
import '../../components/AlertBox.dart';
import 'package:power_she_pre/components/AppBarHome.dart';
import '../../components/BottomBar.dart';
import 'package:sidebarx/sidebarx.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

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
  String userId = '';
  late Stream<QuerySnapshot> selectedDoc;
  String userName = '';
  bool spinner = false;
  String url = '';
  // final _razorpay = Razorpay();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    // _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    // _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _razorpay.clear(); // Removes all listeners
  }

  // void _handlePaymentSuccess(PaymentSuccessResponse response) {
  //   // Do something when payment succeeds
  // }
  //
  // void _handlePaymentError(PaymentFailureResponse response) {
  //   // Do something when payment fails
  // }
  //
  // void _handleExternalWallet(ExternalWalletResponse response) {
  //   // Do something when an external wallet is selected
  // }
  void getDoc() async {
    final docref = await _firestore.collection("users").doc(userId).get();
    setState(() {
      userName = docref['fullName'];
      url = docref['url'];
      // print(userName);
      // print(userId);
      //documents[index]['sell_id']
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbase,
        appBar: AppBarHome(heading: 'Store'),
        endDrawer: EndDrawer(),
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
                      // print(userId);
                      // print(futureSnapshot.data);
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
                      // print(futureSnapshot.data);
                      return StreamBuilder<QuerySnapshot>(

                          // <2> Pass `Stream<QuerySnapshot>` to stream

                          stream: _firestore
                              .collection('store')
                              .where('buy_id',
                                  isNotEqualTo: futureSnapshot.data)
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

                                      return SizedBox(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.6,
                                        child: Card(
                                          elevation: 10,
                                          shadowColor: Colors.black,
                                          color: Colors.white,
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
                                              padding:
                                                  const EdgeInsets.all(20.0),
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
                                                          backgroundImage:NetworkImage(
                                                              (documents[index].data() as Map<String, dynamic>).containsKey("url")?documents[index]['url']:url
                                                          ),
                                                        ),
                                                      ),
                                                      // getName(documents[index]['sell_id'])
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 15.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              documents[index][
                                                                  'product_name'],
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              'Seller: ' +
                                                                  documents[
                                                                          index]
                                                                      [
                                                                      'seller_name'],
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w200,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
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
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                            documents[index]
                                                                ['Bio']),
                                                      ),
                                                    ],
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 230,
                                                      decoration: BoxDecoration(
                                                        color: kbase,
                                                        //border: Border.all(width: 2,color: kdblue),
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Text(
                                                          "₹" +
                                                              documents[index]
                                                                      ['price']
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
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
                                                              .collection(
                                                                  'store')
                                                              .doc(documents[
                                                                      index]
                                                                  .id)
                                                              .update({
                                                            'order_now': true,
                                                            'buy_id': userId,
                                                            'buyer_name':
                                                                userName,
                                                          });
                                                          setState(() {
                                                            spinner = false;
                                                          });
                                                        },
                                                        child: Text(
                                                          documents[index][
                                                                  'order_now']
                                                              ? 'Added'
                                                              : 'Buy Now',
                                                          style: TextStyle(
                                                              color: kbase),
                                                        ),
                                                        color: documents[index]
                                                                ['order_now']
                                                            ? Colors.grey
                                                            : kdblue,
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
                                height:
                                    MediaQuery.of(context).size.height / 1.3,
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
