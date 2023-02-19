import'package:flutter/material.dart';
import'package:power_she_pre/constants.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tflite/tflite.dart';

class GetGender {
  final String imageLink;
  GetGender({required this.imageLink});

  List _recognitions = [];

  Future<List> initialFunc() async {
    loadModel();
    await recognizeImage(imageLink);

    return _recognitions;
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  Future recognizeImage(String imageLink) async {
    var recognitions = await Tflite.runModelOnImage(
      path: imageLink,
      numResults: 2,
      threshold: 0.1,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    if (recognitions != null) {
      _recognitions = recognitions;
      print(recognitions);
    }
  }
}
