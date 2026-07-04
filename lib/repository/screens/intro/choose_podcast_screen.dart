import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/app_routes.dart';

import '../../../domain/app_colors.dart';
import '../../../domain/ui_helper.dart';
import '../../widgets/my_custom_rounded_btn.dart';
import '../../widgets/my_rounded_image_card.dart';

class ChoosePodcastScreen extends StatefulWidget {
  const ChoosePodcastScreen({super.key});

  @override
  State<ChoosePodcastScreen> createState() => _ChoosePodcastScreenState();
}

class _ChoosePodcastScreenState extends State<ChoosePodcastScreen> {
  List<int> selectedPodcast = [];

  List<List<Map<String, dynamic>>> mPodcast = [
    [
      {"imgPath": "assets/images/Members.png", "name": "Members"},
      {"imgPath": "assets/images/Afterburner.png", "name": "After Burner"},
      {"imgPath": "", "name": "More In True Crime"},
    ],

    [
      {
        "imgPath": "assets/images/Anthem of the Peaceful Army.png",
        "name": "Peaceful Army",
      },
      {"imgPath": "assets/images/Bryce Vine.png", "name": "Bryce Vine"},
      {"imgPath": "", "name": "More In True Crime"},
    ],
    [
      {
        "imgPath": "assets/images/Dance Gavin Dance - Members.png",
        "name": "Members",
      },
      {
        "imgPath": "assets/images/Dance Gavin Dance.png",
        "name": "Dance Gavin Dance",
      },
      {"imgPath": "", "name": "More In True Crime"},
    ],
    [
      {"imgPath": "assets/images/From the Fires.png", "name": "From"},
      {"imgPath": "assets/images/Afterburner.png", "name": "After Burner"},
      {"imgPath": "", "name": "More In True Crime"},
    ],
    [
      {"imgPath": "assets/images/From the Fires.png", "name": "From"},
      {"imgPath": "assets/images/Afterburner.png", "name": "After Burner"},
      {"imgPath": "", "name": "More In True Crime"},
    ],
    [
      {
        "imgPath": "assets/images/Dance Gavin Dance - Members.png",
        "name": "Members",
      },
      {
        "imgPath": "assets/images/Dance Gavin Dance.png",
        "name": "Dance Gavin Dance",
      },
      {"imgPath": "", "name": "More In True Crime"},
    ],
    [
      {"imgPath": "assets/images/Members.png", "name": "Members"},
      {"imgPath": "assets/images/Afterburner.png", "name": "After Burner"},
      {"imgPath": "", "name": "More In True Crime"},
    ],

    [
      {
        "imgPath": "assets/images/Anthem of the Peaceful Army.png",
        "name": "Peaceful Army",
      },
      {"imgPath": "assets/images/Bryce Vine.png", "name": "Bryce Vine"},
      {"imgPath": "", "name": "More In True Crime"},
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Now choose some podcasts.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                  fontFamily: "bold",
                  fontSize: 34,
                ),
              ),
              mSpacer(),
              SizedBox(
                height: 50,
                child: TextField(decoration: getSearchTextField()),
              ),
              mSpacer(mHeight: 21),
              Expanded(
                child: Stack(
                  children: [
                    ListView.builder(
                      itemCount: mPodcast.length,
                      itemBuilder: (_, index) {
                        return Container(
                          padding: EdgeInsets.only(bottom: 11),
                          height: 170,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: mPodcast[index].length,
                            itemBuilder: (_, childIndex) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.5),
                                child: Column(
                                  children: [
                                    childIndex == 2
                                        ? Container(
                                            width: 120,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              color:
                                                  Colors.primaries[Random()
                                                      .nextInt(
                                                        Colors.primaries.length,
                                                      )],
                                            ),
                                            child: Center(
                                              child: Text(
                                                mPodcast[index][childIndex]['name'],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "bold",
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )
                                        : MyRoundedImageCard(
                                            mWidth: 120,
                                            mHeight: 120,
                                            imgPath:
                                                mPodcast[index][childIndex]['imgPath'],
                                          ),
                                    mSpacer(),
                                    Text(
                                      childIndex == 2
                                          ? ""
                                          : mPodcast[index][childIndex]['name'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: 180,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            stops: [0.05, 0.8],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                        child: Center(
                          child: MyCustomRoundedBtn(
                            mWidth: 100,
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRoutes.dashboardScreen,
                                (route) => false,
                              );
                            },
                            text: "Done",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
