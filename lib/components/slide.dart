import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
Slide({required this.imgPath, required this.text});
final String imgPath;
final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(
                height: 300.0,
                width: 200.0,
                image: AssetImage(imgPath),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
              text,
              textAlign: TextAlign.center,
              // overflow: TextOverflow.ellipsis,
              
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                decoration: TextDecoration.none,
                fontFamily: 'Lustria',
            ),
          ),
        ],
      ),
    );
  }
}