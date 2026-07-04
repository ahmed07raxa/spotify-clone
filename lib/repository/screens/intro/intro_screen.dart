import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/app_colors.dart';
import 'package:spotify_clone/domain/ui_helper.dart';
import 'package:spotify_clone/repository/widgets/my_custom_rounded_btn.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Stack(
        children: [
          Image.asset("assets/images/intro.png"),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.blackColor.withOpacity(0.5),
                  AppColors.blackColor,
                ],
              ),
            ),
          ),
          bottomLoginUi(),
        ],
      ),
    );
  }

  Widget bottomLoginUi() => Container(
    width: double.infinity,
    padding: EdgeInsets.only(bottom: 70),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/Logo.png", width: 50, height: 50),
        mSpacer(),
        Text(
          "Millions of Songs.\nFree on Spotify.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        mSpacer(),
        MyCustomRoundedBtn(
          text: "Sign up free",
          onTap: () {},
          mWidth: 300,
          textColor: Colors.black,
        ),
        mSpacer(),
        MyCustomRoundedBtn(
          mIconPath: "assets/svg/Google.svg",
          text: "Continue with Google",
          onTap: () {},
          mWidth: 300,
          isOutlined: true,
          textColor: Colors.white,
        ),
        mSpacer(),
        MyCustomRoundedBtn(
          mIconPath: "assets/svg/facebook.svg",
          text: "Continue with Facebook",
          onTap: () {},
          mWidth: 300,
          isOutlined: true,
          textColor: Colors.white,
        ),
        mSpacer(),
        MyCustomRoundedBtn(
          mIconPath: "assets/svg/apple.svg",
          text: "Continue with Apple",
          onTap: () {},
          mWidth: 300,
          isOutlined: true,
          textColor: Colors.white,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Login",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}
