import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/app_colors.dart';
import '../../../domain/ui_helper.dart';

class HomeBottomNav extends StatefulWidget {
  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
  List<Map<String, dynamic>> mRecentlyPlayedList = [
    {
      "imgPath": "assets/images/Screen Shot 2021-12-08 at 13.39 2.png",
      "name": "1(Remastered)",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-08 at 14.16 1.png",
      "name": "Lana Del Rey",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-08 at 14.18 1.png",
      "name": "Marvin Gaye",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-08 at 14.33 1.png",
      "name": "Indie Pop",
    },
  ];
  List<Map<String, dynamic>> mReviewListUi = [
    {
      "imgPath": "assets/images/Screen Shot 2021-12-07 at 14.11 1.png",
      "name": "Your Top Songs 2021",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-07 at 14.17 1.png",
      "name": "Your Artists Revealed",
    },
  ];

  List<Map<String, dynamic>> mEditorsPickList = [
    {
      "imgPath": "assets/images/Screen Shot 2021-12-07 at 14.27 1.png",
      "name": "Ed Sheeran, Big Sean,\nJuice WRLD, Post Malone",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-07 at 14.22 1.png",
      "name": "Mitski, Tame Impala,\nGlass Animals, Charli XCX",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-13 at 17.56 1.png",
      "name": "",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              mSpacer(),
              recentlyPlayedUi(),
              mSpacer(mHeight: 14),
              recentlyPlayedListUi(),
              mSpacer(),
              reviewUi(),
              mSpacer(mHeight: 22),
              reviewListUi(),
              mSpacer(),
              editorsPickUi(),
            ],
          ),
        ),
      ),
    );
  }

  Widget recentlyPlayedUi() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "Recently played",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              SvgPicture.asset(
                "assets/svg/Vector-1.svg",
                color: Colors.white,
                height: 22,
                width: 22,
              ),
              mSpacer(mWidth: 20),
              SvgPicture.asset(
                "assets/svg/orientation lock-1.svg",
                color: Colors.white,
                height: 22,
                width: 22,
              ),
              mSpacer(mWidth: 20),
              SvgPicture.asset(
                "assets/svg/Settings-1.svg",
                color: Colors.white,
                height: 24,
                width: 24,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget recentlyPlayedListUi() {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mRecentlyPlayedList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 11),
            child: Column(
              children: [
                Image.asset(
                  mRecentlyPlayedList[index]['imgPath'],
                  width: 100,
                  height: 100,
                ),
                mSpacer(mHeight: 8),
                Text(
                  mRecentlyPlayedList[index]['name'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget reviewUi() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11),
      child: Row(
        children: [
          Image.asset(
            "assets/images/Screen Shot 2021-12-07 at 12.39 1.png",
            width: 55,
            height: 55,
          ),
          mSpacer(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "#SPOTIFYWRAPPED",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                Text(
                  "Your 2021 in review",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "bold",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget reviewListUi() {
    return SizedBox(
      height: 185,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mReviewListUi.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  mReviewListUi[index]['imgPath'],
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                mSpacer(mHeight: 8),
                Text(
                  mReviewListUi[index]['name'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: "bold",
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget editorsPickUi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: Text(
            "Editor’s picks",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "bold",
            ),
          ),
        ),
        mSpacer(mHeight: 8),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mEditorsPickList.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      mEditorsPickList[index]['imgPath'],
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    mSpacer(mHeight: 8),
                    Text(
                      mEditorsPickList[index]['name'],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
