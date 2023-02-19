import 'dart:io';
import 'dart:convert';
import 'dart:async';
import'package:flutter/material.dart';
import'package:power_she_pre/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:power_she_pre/screens/home_screen.dart';
import 'package:power_she_pre/screens/splash.dart';
import 'package:tflite/tflite.dart';
import '../../components/RoundedButton.dart';
import '../../components/appBarInit.dart';
import '../onboard/onboardScreen.dart';
import '../welcome_screen.dart';
import 'package:file_picker/file_picker.dart';

import 'get_gender.dart';
class SelfieUpload extends StatefulWidget {
  static const String id = "selfie_upload_screen";
  const SelfieUpload({Key? key}) : super(key: key);

  @override
  State<SelfieUpload> createState() => _SelfieUploadState();
}

class _SelfieUploadState extends State<SelfieUpload> {
  var imageFile;
  String downurl = '';
  bool spinner = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Do you really want to exit?'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text(''),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      fontSize: 18,
                      color: kpink,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, WelcomeScreen.id);
                  },
                ),
                TextButton(
                  child: const Text(
                    'No',
                    style: TextStyle(
                      fontSize: 18,
                      color: kpink,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
        return Future<bool>.value(true);
      },
      child: Scaffold(
        backgroundColor: kbase,
        body: ModalProgressHUD(
          inAsyncCall: spinner,
          progressIndicator: const CircularProgressIndicator(
            color: kdblue,
          ),
          child: SafeArea(
            child: Column(
              children: [
                AppBarInit(),
                Container(
                  child: imageFile == null
                      ? Container(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Padding(
                              padding: EdgeInsets.only(bottom: 9),
                              child: Text(
                                "Upload your selfie",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              "Take a selfie of yourself to identify yourself as woman. This app is exclusively for women and helps to create a safe and secure environment for them.",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Image.asset(
                          'images/selfie_cover.webp',
                          width: 250,
                          height: 250,
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    70, 8, 70, 8),
                                child: RoundedButton(
                                  buttonText: 'Click a picture',
                                  onPressed: () {
                                    _getFromCamera();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              child: Text(
                                'Skip to Home',
                                style: TextStyle(
                                    shadows: [
                                      Shadow(
                                          color: kdblue,
                                          offset: Offset(0, -5))
                                    ],
                                    color: Colors.transparent,
                                    decoration: TextDecoration.underline,
                                    decorationColor: kpink,
                                    decorationThickness: 4,
                                    fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, HomeScreen.id);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                      : Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(
                                "Here is the pic that you clicked!",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700),
                              ),
                              subtitle: Text(
                                "Thankyou for the noble work ❤",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 360,
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(color: kdblue, width: 5),
                            ),
                            child: Image.file(
                              imageFile,
                              fit: BoxFit.cover,
                            ),
                          ),
                          RoundedButton(
                            buttonText: 'Next',
                            onPressed: () async {
                              setState(() {
                                spinner = true;
                              });
                              GetGender _getGender =
                              GetGender(imageLink: imageFile.path);
                              List list = await _getGender.initialFunc();

                              print(list);
                              // print(sec_list);
                              if (list.length > 1 &&
                                  list[0]['label'] == '0 M') {
                                setState(() {
                                  spinner = false;
                                });
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible:
                                  false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                          'Please upload a clear image of yourself.'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const <Widget>[
                                            Text(
                                                'Your image must be front-facing and must have proper lighting.'),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text(
                                            'Ok',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: kpink,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, SelfieUpload.id);
                                            ;
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              //}
                              // else if (!sec_list.isEmpty &&
                              //     sec_list[0]['label'] == 'Cat') {
                              //   setState(() {
                              //     spinner = false;
                              //   });
                              //   showDialog<void>(
                              //     context: context,
                              //     barrierDismissible:
                              //     false, // user must tap button!
                              //     builder: (BuildContext context) {
                              //       return AlertDialog(
                              //         title: const Text(
                              //             'You have uploaded the image of a cat!'),
                              //         content: SingleChildScrollView(
                              //           child: ListBody(
                              //             children: const <Widget>[
                              //               Text(
                              //                   'You are required to upload a clear image of your dog.'),
                              //             ],
                              //           ),
                              //         ),
                              //         actions: <Widget>[
                              //           TextButton(
                              //             child: const Text(
                              //               'Ok',
                              //               style: TextStyle(
                              //                 fontSize: 18,
                              //                 color: kpink,
                              //               ),
                              //             ),
                              //             onPressed: () {
                              //               Navigator.pushNamed(
                              //                 context,
                              //                 FinderUpload.id,
                              //               );
                              //             },
                              //           ),
                              //         ],
                              //       );
                              //     },
                              //   );
                              } else {
                                // await storage.uploadFile(
                                //     imageFile.path, 'finder_image');
                                // downurl =
                                // await storage.downloadUrl('finder_image');

                                // Navigator.pushNamed(
                                //     context, FinderCheckList.id, arguments: {
                                //   'list': list,
                                //   'url': downurl
                                // });
                                Navigator.pushNamed(context,OnboardScreen.id);
                                setState(() {
                                  spinner = false;
                                });
                              }
                            },
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        // print(imageFile);
      });
    }
  }
}




