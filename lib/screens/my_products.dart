import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:power_she_pre/constants.dart';

import '../components/AppBarHome.dart';
import 'new_product.dart';

class MyProducts extends StatefulWidget {
  static const String id = "my_products";
  const MyProducts({Key? key}) : super(key: key);

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedInUser;
  String userId='';
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
    }
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                onPressed: (){
                  Navigator.pushNamed(context, NewProduct.id);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add_box_outlined,size: 18,color: Colors.white,),
                      SizedBox(width: 7,),
                      Text(
                        'Add New Product',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
                color: kdblue,
                minWidth: 150,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
            ),
              ),
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
                            .where('sell_id', isEqualTo: futureSnapshot.data)
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
                                          0.3,
                                      child: Card(
                                        elevation: 10,
                                        shadowColor: Colors.black,
                                        color: kbase,
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.3,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              children: [
                                                Container(height: 200,width: 130,
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
                                                        Column(
                                                          children: [
                                                            // TextButton(
                                                            //   onPressed: () {},
                                                            //   child: Container(
                                                            //     color: getColor(documents[index]['order_now'],documents[index]['confirm'],documents[index]['delivered']),
                                                            //     padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                                            //     child: Text(
                                                            //       getText(documents[index]['order_now'],documents[index]['confirm'],documents[index]['delivered']),
                                                            //       style: TextStyle(color: Colors.white, fontSize: 13.0),
                                                            //     ),
                                                            //   ),
                                                            // )
                                                            SizedBox(
                                                              height: 30,
                                                            ),
                                                            documents[index]['order_now']==false?
                                                                TextButton(
                                                                  style: ButtonStyle(
                                                                    backgroundColor: MaterialStateProperty.all<Color>(kpink),
                                                                    shape: MaterialStateProperty.all(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(30.0),
                                                                        side: BorderSide(width: 2,),

                                                                      ),
                                                                    ),
                                                                  ),
                                                                  onPressed: (){},
                                                                  child:Container(
                                                                    // color:Colors.grey,
                                                                    padding:const EdgeInsets.symmetric(vertical: 2, horizontal: 10) ,
                                                                    child: Text(
                                                                      'In store',
                                                                      style:TextStyle(color: Colors.white,fontSize: 13.0),
                                                                    ),
                                                                  )
                                                                ):(documents[index]['confirm'] && !documents[index]['delivered'])?
                                                                OutlinedButton(onPressed:() async {
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
                                                                        'delivered': true,
                                                                      });
                                                                  setState(
                                                                          () {
                                                                        spinner =
                                                                        false;
                                                                      });
                                                                } , child: Text(
                                                                  'Confirm Delivery',style: TextStyle(color: Colors.red
                                                                ))):(documents[index]['delivered'])?
                                                            OutlinedButton(onPressed:(){} , child: Text(
                                                                'Delivered',style: TextStyle(color: Colors.white )),style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.green) ),):
                                                            OutlinedButton(onPressed:() async {
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
                                                                    'confirm': true,
                                                                  });
                                                              setState(
                                                                      () {
                                                                    spinner =
                                                                    false;
                                                                  });
                                                            } , child: Text(
                                                              'Confirm  Order' ,style: TextStyle(color: Colors.orange)),)
                                                            ,
                                                            (documents[index]['order_now'])?TextButton(
                                                              onPressed: () async{


                                                                final docref = await _firestore.collection("details").doc(documents[index]['buy_id']).get();
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
                                                                          "Details of the buyer"),
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
                                                            ):TextButton(onPressed: (){}, child: Container())
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
                                                                      'Are you sure you want to delete this product?'),
                                                                  content:
                                                                  SingleChildScrollView(
                                                                    child: ListBody(
                                                                      children: const <
                                                                          Widget>[
                                                                        Text(
                                                                            ''),
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
                                                                        await _firestore.runTransaction(
                                                                                (Transaction
                                                                            myTransaction) async {
                                                                              await myTransaction
                                                                                  .delete(
                                                                                  documents[index].reference);
                                                                            });
                                                                        FirebaseStorage
                                                                            .instance
                                                                            .refFromURL(documents[index]
                                                                        [
                                                                        'image'])
                                                                            .delete();
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
}
