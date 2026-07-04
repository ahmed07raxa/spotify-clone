import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/app_routes.dart';

import '../../../domain/app_colors.dart';
import '../../../domain/ui_helper.dart';
import '../../widgets/my_circular_img_bg.dart';
import '../../widgets/my_custom_rounded_btn.dart';

class ChooseArtistScreen extends StatefulWidget {
  const ChooseArtistScreen({super.key});

  @override
  State<ChooseArtistScreen> createState() => _ChooseArtistScreenState();
}

class _ChooseArtistScreenState extends State<ChooseArtistScreen> {
  List<int> selectedArtist = [];

  List<Map<String, dynamic>> mArist = [
    {"imgPath": "assets/images/Members.png", "name": "Members"},
    {"imgPath": "assets/images/Afterburner.png", "name": "After Burner"},
    {
      "imgPath": "assets/images/Anthem of the Peaceful Army.png",
      "name": "Peaceful Army",
    },
    {"imgPath": "assets/images/Bryce Vine.png", "name": "Bryce Vine"},
    {"imgPath": "assets/images/Members.png", "name": "Members"},
    {"imgPath": "assets/images/Afterburner.png", "name": "After Burner"},
    {
      "imgPath": "assets/images/Anthem of the Peaceful Army.png",
      "name": "Peaceful Army",
    },
    {"imgPath": "assets/images/Bryce Vine.png", "name": "Bryce Vine"},
    {"imgPath": "assets/images/Members.png", "name": "Members"},
    {"imgPath": "assets/images/Afterburner.png", "name": "After Burner"},
    {
      "imgPath": "assets/images/Anthem of the Peaceful Army.png",
      "name": "Peaceful Army",
    },
    {"imgPath": "assets/images/Bryce Vine.png", "name": "Bryce Vine"},
    {"imgPath": "assets/images/Members.png", "name": "Members"},
    {"imgPath": "assets/images/Afterburner.png", "name": "After Burner"},
    {
      "imgPath": "assets/images/Anthem of the Peaceful Army.png",
      "name": "Peaceful Army",
    },
    {"imgPath": "assets/images/Bryce Vine.png", "name": "Bryce Vine"},
    {"imgPath": "assets/images/Members.png", "name": "Members"},
    {"imgPath": "assets/images/Afterburner.png", "name": "After Burner"},
    {
      "imgPath": "assets/images/Anthem of the Peaceful Army.png",
      "name": "Peaceful Army",
    },
    {"imgPath": "assets/images/Bryce Vine.png", "name": "Bryce Vine"},
    {"imgPath": "assets/images/Bryce Vine.png", "name": "Bryce Vine"},
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
              SizedBox(
                width: 400,
                child: Text(
                  "Choose 3 or more artists you like.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                    fontFamily: "bold",
                    fontSize: 30,
                  ),
                ),
              ),
              mSpacer(),
              SizedBox(
                height: 50,
                child: TextField(decoration: getSearchTextField()),
              ),
              mSpacer(mHeight: 18),
              Expanded(
                child: Stack(
                  children: [
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 11,
                        crossAxisSpacing: 11,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: mArist.length,
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: () {
                            if (!selectedArtist.contains(index)) {
                              selectedArtist.add(index);
                              setState(() {});
                            } else {
                              selectedArtist.remove(index);
                              setState(() {});
                            }
                          },
                          child: Column(
                            children: [
                              mSpacer(),
                              MyCircularImgBg(
                                imgPath: mArist[index]['imgPath'],
                                isSelected: selectedArtist.contains(index),
                              ),
                              mSpacer(),
                              Text(
                                mArist[index]['name'],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "bold",
                                ),
                              ),
                            ],
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
                              Colors.black.withOpacity(0.6),
                            ],
                          ),
                        ),
                        child: selectedArtist.length >= 3
                            ? Center(
                                child: MyCustomRoundedBtn(
                                  mWidth: 100,
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.choosePodcastScreen,
                                    );
                                  },
                                  text: "Next",
                                ),
                              )
                            : SizedBox(),
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
