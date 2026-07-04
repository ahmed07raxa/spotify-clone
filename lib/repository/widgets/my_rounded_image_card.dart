import 'package:flutter/material.dart';

class MyRoundedImageCard extends StatelessWidget {
  double mWidth;
  double mHeight;
  String imgPath;
  bool isSpotifyOriginal;
  bool isBlackBg = false;
  MyRoundedImageCard({
    super.key,
    this.mWidth = 100,
    this.mHeight = 100,
    required this.imgPath,
    this.isSpotifyOriginal = true,
    this.isBlackBg = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mWidth,
      height: mHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        image: DecorationImage(image: AssetImage(imgPath)),
      ),
      child: isSpotifyOriginal
          ? Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(11)),
            color: Colors.white,
          ),
          child: Center(
            child: Image.asset(
              "assets/images/Logo.png",
              width: 15,
              height: 15,
              color: isBlackBg ? Colors.black : Colors.white,
            ),
          ),
        ),
      )
          : Container(),
    );
  }
}