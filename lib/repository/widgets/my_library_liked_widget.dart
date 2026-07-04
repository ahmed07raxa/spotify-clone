import 'package:flutter/material.dart';

import '../../domain/ui_helper.dart';

class MyLibraryLikedWidget extends StatelessWidget {
  bool isLeadingGradient;
  List<Color>? mGradientColors;
  Color? solidColor;
  IconData mLeadingIcon;
  Color mLeadingIconColor;
  String mTitle;
  String mSubTitle;

  MyLibraryLikedWidget({
    this.mLeadingIconColor = Colors.white,
    this.mLeadingIcon = Icons.favorite,
    this.solidColor,
    this.isLeadingGradient = false,
    this.mGradientColors,
    required this.mTitle,
    required this.mSubTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          gradient: isLeadingGradient
              ? LinearGradient(
            colors:
            mGradientColors ??
                [Color(0XFF4A39EA), Color(0XFF868AE1), Color(0XFF89D4DB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : null,
          color: solidColor ?? Color(0XFF5E3B7A),
        ),
        child: Icon(mLeadingIcon, color: mLeadingIconColor),
      ),
      title: Text(mTitle),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      subtitleTextStyle: TextStyle(color: Colors.grey,fontSize: 12),
      subtitle: Row(
        children: [
          Image.asset("assets/images/pin.png"),
          mSpacer(
              mWidth: 4
          ),
          Text(mSubTitle)
        ],
      ) ,
    );
  }
}