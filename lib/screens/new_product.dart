import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:power_she_pre/components/AppBarHome.dart';
import 'package:power_she_pre/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:power_she_pre/storage.dart';
class NewProduct extends StatefulWidget {
  static const String id = "new_product";
  const NewProduct({Key? key}) : super(key: key);

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  Storage storage = Storage();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedInUser;
  String userId='';
  String userName='';
  bool spinner = false;
  int currVal=0;
  String Bio='';
  String p_name='';
  String p_id='';
  String price='';
  var imagePath;
  var imageName;
  String imageUrl = "";
  String downurl = '';

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
      appBar: AppBarHome(),
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: spinner,
          progressIndicator: const CircularProgressIndicator(
            color: kpink,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.left,
                    onChanged: (value) {
                      //Do something with the user input.
                      // email = value;
                      setState(() {
                        p_name=value;
                      });
                    },
                    decoration: kProductFieldDecoration.copyWith(
                        hintText: 'e.g. Jewellery',labelText: 'Product Name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.left,
                    onChanged: (value) {
                      //Do something with the user input.
                      // email = value;
                      setState(() {
                        Bio=value;
                      });
                    },
                    style: TextStyle(fontSize: 15),
                    maxLines: 5,
                    minLines: 3,
                    decoration: kProductFieldDecoration.copyWith(
                        hintText: 'Describe your Product here',labelText: 'About the Product'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.left,
                    onChanged: (value) {
                      //Do something with the user input.
                      // email = value;
                      setState(() {
                        price=value;
                        print(value);
                        print(price);
                      });
                    },
                    decoration: kProductFieldDecoration.copyWith(
                        hintText: 'e.g. 499',labelText: 'Price (in INR)'),
                  ),
                ),
                TextButton(onPressed: ()async{
                  setState(() {
                    spinner=true;
                  });
                  _getFromGallery();

                setState(() {
                  spinner=false;
                });
                }, child:Text('Upload Image')),

                TextButton(
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(kpink)
                  ),
                  onPressed: () async {
                  setState(
                          () {
                        spinner =
                        true;
                      });
                  print(imagePath+" "+imageName);
                  await storage.uploadFile(
                      imagePath, imageName);
                  downurl =
                  await storage.downloadUrl(imageName);
                  setState(() {
                    imageUrl=downurl;
                  });
                  await _firestore.collection('store').add({
                    'Bio':Bio,
                    'buy_id':"",
                    'buyer_name':"",
                    'confirm':false,
                    'delivered':false,
                    'image':imageUrl,
                    'order_now':false,
                    'price':price,
                    'product_id':p_id,
                    'product_name':p_name,
                    'sell_id':userId,
                    'seller_name':userName

                  }).then((value) async {
                    setState(
                            () {
                          spinner =
                          true;
                        });
                    await _firestore
                        .collection(
                        'store')
                        .doc(value
                            .id)
                        .update(
                        {
                          'product_id': value.id,
                        });
                    setState(
                            () {
                          spinner =
                          false;
                        });


                  }).catchError((error) {});
                  setState(
                          () {
                        spinner =
                        false;
                      });
                }, child: Text('Save',style: TextStyle(color:Colors.white),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
  _getFromGallery() async {
    final results = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
    );

    if (results != null) {
      setState(() {
        imagePath = results.files.single.path;
        imageName = results.files.single.name;

        print(imageName);
        print(imagePath);
      });
    }
  }
}

