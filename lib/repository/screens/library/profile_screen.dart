import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../domain/app_colors.dart';
import '../../../domain/ui_helper.dart';

class MyProfileNavScreen extends StatefulWidget {
  String profilePicPath;
  MyProfileNavScreen({super.key, required this.profilePicPath});

  @override
  State<MyProfileNavScreen> createState() => _MyProfileNavScreenState();
}

class _MyProfileNavScreenState extends State<MyProfileNavScreen> {
  List<Map<String, dynamic>> mList = [
    {
      "imgPath": "assets/images/Screen Shot 2021-12-10 at 14.43.png",
      "title": "Shazam",
      "subTitle": "7 likes",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-10 at 14.44 1.png",
      "title": "Road trip",
      "subTitle": "4 likes",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-10 at 14.43-1.png",
      "title": "Study",
      "subTitle": "5 likes",
    },
  ];

  PaletteGenerator? paletteGenerator;
  @override
  void initState() {
    super.initState();
    initializedPaletteGenerator();
  }

  Future<void> initializedPaletteGenerator() async {
    paletteGenerator = await getColorPalette(widget.profilePicPath);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 1.0],
                colors: [
                  paletteGenerator != null
                      ? HSLColor.fromColor(
                          paletteGenerator!.dominantColor!.color,
                        ).withLightness(0.34).toColor()
                      : Colors.blue,
                  Colors.black,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                mSpacer(mHeight: 70),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.more_horiz, color: Colors.white),
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.profilePicPath),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryBlackColor,
                  ),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                mSpacer(mHeight: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "23",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "PLAYLISTS",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "58",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "FOLLOWERS",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "43",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "FOLLOWING",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Playlist",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: mList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Image.asset(mList[index]["imgPath"]),
                        title: Text(
                          mList[index]['title'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          mList[index]['subTitle'],
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: SvgPicture.asset("assets/svg/Right-1.svg"),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
