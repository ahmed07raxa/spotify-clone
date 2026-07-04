import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domain/app_colors.dart';

class MyCustomRoundedBtn extends StatelessWidget {
  VoidCallback onTap;
  double mWidth;
  double mHeight;
  Color bgColor;
  String text;
  Color? textColor;
  String? mIconPath;
  bool isOutlined;

  // CONSTRUCTOR
  MyCustomRoundedBtn({
    super.key,
    required this.onTap,
    required this.text,
    this.textColor = Colors.black,
    this.mIconPath,
    this.mWidth = 300,
    this.mHeight = 50,
    this.bgColor = Colors.white,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: mWidth,
        height: mHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isOutlined ? Colors.transparent : bgColor,
          border: isOutlined
              ? Border.all(
            width: 1,
            color: isOutlined ? Colors.white : Colors.transparent,
          )
              : null,
        ),
        child: mIconPath != null
            ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: Row(
            children: [
              SvgPicture.asset(mIconPath!, width: 25, height: 25),
              Expanded(
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textColor
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
            : Center(
          child: Text(
            text,
            style: TextStyle(color: textColor,fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }


}
