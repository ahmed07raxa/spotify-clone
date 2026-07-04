import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/domain/app_routes.dart';

import '../../../domain/app_colors.dart';
import '../../../domain/ui_helper.dart';
import '../../widgets/my_custom_rounded_btn.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  int selectedIndex = 0;
  List<Widget> allPages = [];
  bool isPP1Selected = false;
  bool isPP2Selected = false;
  @override
  void initState() {
    super.initState();
    allPages = [stepOneUi(), stepTwoUi(), stepThreeUi(), stepFourUi()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            if (selectedIndex > 0) {
              selectedIndex--;
              setState(() {});
            } else {
              Navigator.pop(context);
            }
          },
          child: Padding(
            padding: EdgeInsets.all(14),
            child: SvgPicture.asset(
              "assets/svg/Left.svg",
              color: Colors.white,
              width: 12,
              height: 12,
            ),
          ),
        ),
        title: Text(
          "Create account",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(11),
        child: Column(
          children: [
            allPages[selectedIndex],
            mSpacer(mHeight: 16),
            Padding(
              padding: EdgeInsets.only(bottom: selectedIndex > 3 ? 0 : 43),
              child: MyCustomRoundedBtn(
                text: selectedIndex < 3 ? "Next" : "Create an account",
                mWidth: selectedIndex < 3 ? 100 : 180,
                bgColor: AppColors.whiteColor,
                onTap: () {
                  if (selectedIndex < 3) {
                    selectedIndex++;
                    setState(() {});
                  } else {
                    Navigator.pushNamed(context, AppRoutes.chooseArtistScreen);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget stepOneUi() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      mSpacer(mHeight: 7),
      Text(
        'What’s your email?',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      TextField(
        cursorColor: Colors.white,
        decoration: getCreateAccountTextField(),
      ),
      mSpacer(mHeight: 7),
      Text(
        " You’ll need to confirm this email later.",
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
  Widget stepTwoUi() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Create a password',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      TextField(
        cursorColor: Colors.white,
        decoration: getCreateAccountTextField(),
      ),
      mSpacer(mHeight: 7),
      Text(
        "Use at least 8 characters.",
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
  Widget stepThreeUi() => Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What’s your gender?',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        mSpacer(),
        Padding(
          padding: EdgeInsets.all(8),
          child: Wrap(
            runAlignment: WrapAlignment.spaceEvenly,
            runSpacing: 11,
            spacing: 11,
            children: [
              MyCustomRoundedBtn(
                mWidth: 90,
                mHeight: 34,
                isOutlined: true,
                textColor: Colors.white,
                bgColor: AppColors.greyColor,
                onTap: () {},
                text: "Male",
              ),
              MyCustomRoundedBtn(
                mWidth: 100,
                mHeight: 34,
                isOutlined: true,
                textColor: Colors.white,
                bgColor: AppColors.greyColor,
                onTap: () {},
                text: "Female",
              ),
              MyCustomRoundedBtn(
                mWidth: 140,
                mHeight: 34,
                isOutlined: true,
                textColor: Colors.white,
                bgColor: AppColors.greyColor,
                onTap: () {},
                text: "not prefer to say",
              ),
              MyCustomRoundedBtn(
                mWidth: 100,
                mHeight: 34,
                isOutlined: true,
                textColor: Colors.white,
                bgColor: AppColors.greyColor,
                onTap: () {},
                text: "other",
              ),
            ],
          ),
        ),
      ],
    ),
  );
  Widget stepFourUi() => Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What’s your name?',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        TextField(
          cursorColor: Colors.white,
          decoration: getCreateAccountTextField(),
        ),
        mSpacer(mHeight: 7),
        Text(
          "This appears on your spotify profile",
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        mSpacer(mHeight: 21),
        Divider(color: AppColors.greyColor),
        Text(
          'By tapping on "Create account", you agree to the spotify Terms of Use.',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        mSpacer(mHeight: 21),
        Text(
          'Terms of Use',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
        mSpacer(mHeight: 21),
        Text(
          'By tapping on "Create account", you agree to the spotify Terms of Use.',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        mSpacer(mHeight: 21),
        Text(
          'Privacy Policy',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
        mSpacer(mHeight: 21),
        RadioListTile.adaptive(
          title: Text(
            'Please send me news and offers from Spotify.',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          controlAffinity: ListTileControlAffinity.trailing,
          value: isPP1Selected,
          groupValue: false,
          onChanged: (value) {
            isPP1Selected = value!;
            setState(() {});
          },
        ),
        mSpacer(mHeight: 21),
        RadioListTile.adaptive(
          title: Text(
            'Share my registration data with Spotify’s content providers for marketing purposes.',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          controlAffinity: ListTileControlAffinity.trailing,
          value: isPP2Selected,
          groupValue: false,
          onChanged: (value) {
            isPP2Selected = value!;
            setState(() {});
          },
        ),
      ],
    ),
  );
}
