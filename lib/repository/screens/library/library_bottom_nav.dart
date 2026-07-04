import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../domain/app_colors.dart';
import '../../../domain/app_routes.dart';
import '../../../domain/ui_helper.dart';
import '../../widgets/my_library_liked_widget.dart';
import '../../widgets/type_chip_widget.dart';

class LibraryBottomNav extends StatefulWidget {
  const LibraryBottomNav({super.key});

  @override
  State<LibraryBottomNav> createState() => _LibraryBottomNavState();
}

class _LibraryBottomNavState extends State<LibraryBottomNav> {
  List<String> mTypes = ["Playlists", "Artists", "Albums", "Podcasts & shows"];
  List<Map<String, dynamic>> mList = [
    {
      "imgPath": "assets/images/Screen Shot 2021-12-08 at 13.39 2.png",
      "title": "Lolo Zouaï",
      "subTitle": "Artist",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-08 at 13.39 2.png",
      "title": "Lana Del Rey",
      "subTitle": "Artist",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-08 at 13.39 2.png",
      "title": "Front Left",
      "subTitle": "Playlist - Spotify",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-08 at 13.39 2.png",
      "title": "Marvin Gaye",
      "subTitle": "Artist",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-08 at 13.39 2.png",
      "title": "Les",
      "subTitle": "Song - Childish Gambino",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Column(
          children: [
            mSpacer(),
            titleUI(),
            mSpacer(mHeight: 16),
            typeChipUI(),
            mSpacer(mHeight: 16),
            recentlyPlayedTitle(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    mSpacer(mHeight: 16),
                    MyLibraryLikedWidget(
                      mTitle: "Liked Songs",
                      mSubTitle: "Playlist - 58 songs",
                      isLeadingGradient: true,
                    ),
                    mSpacer(mHeight: 5),
                    MyLibraryLikedWidget(
                      mTitle: "New Episodes",
                      mSubTitle: "Updated 2 days ago",
                      isLeadingGradient: false,
                      mLeadingIcon: Icons.notifications_active,
                      mLeadingIconColor: Colors.green,
                    ),
                    mSpacer(),
                    ListView.builder(
                      itemCount: mList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: Image.asset(
                                mList[index]['imgPath'],
                                width: 60,
                                height: 60,
                              ),
                              title: Text(mList[index]['title']),
                              subtitle: Text(mList[index]['subTitle']),
                              titleTextStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              subtitleTextStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            mSpacer(mHeight: 14),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget titleUI() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.profileScreen);
              },
              child: CircleAvatar(
                radius: 20,
                child: Image.asset(
                  "assets/images/image 2.png",
                  width: 200,
                  height: 200,
                ),
              ),
            ),
          ),
          mSpacer(),
          Text(
            "Your Library",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Icon(Icons.add, color: Colors.white, size: 30),
        ],
      ),
    );
  }

  Widget typeChipUI() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          itemCount: mTypes.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return TypeChipWidget(typeName: mTypes[index]);
          },
        ),
      ),
    );
  }

  Widget recentlyPlayedTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.0),
      child: Row(
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Icon(
              Icons.compare_arrows_rounded,
              color: Colors.white,
              size: 16,
            ),
          ),
          Text(
            "Recently played",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          SvgPicture.asset("assets/svg/Component 17.svg"),
        ],
      ),
    );
  }
}