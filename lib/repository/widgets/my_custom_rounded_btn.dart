import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domain/app_colors.dart';

class MyCustomRoundedBtn extends StatelessWidget {
  final VoidCallback onTap;
  final double mWidth;
  final double mHeight;
  final Color bgColor;
  final String text;
  final String? mIconPath;
  final Color textColor;
  final bool isOutlined;
  const MyCustomRoundedBtn({
    super.key,
    this.mWidth = 100,
    this.mHeight = 50,
    required this.onTap,
    this.bgColor = Colors.white,
    required this.text,
    this.mIconPath,
    this.textColor = Colors.white,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: mWidth,
        height: mHeight,
        decoration: BoxDecoration(
          color: isOutlined ? Colors.transparent : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(30),
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
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
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
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      ),
    );
  }
}
