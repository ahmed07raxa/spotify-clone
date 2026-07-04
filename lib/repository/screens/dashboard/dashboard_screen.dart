import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../domain/app_colors.dart';
import '../../../domain/ui_helper.dart';
import '../../widgets/my_compact_music_player_widget.dart';
import '../library/library_bottom_nav.dart';
import '../navigations/home_bottom_nav.dart';
import '../navigations/search_bottom_nav.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PaletteGenerator? paletteGenerator;
  double currentValue = 34;
  bool isPlaying = false;

  List<Widget> mBottomNavPages = [
    HomeBottomNav(),
    SearchBottomNav(),
    LibraryBottomNav(),
  ];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    initializePaletteGenerator();
  }

  Future<void> initializePaletteGenerator() async {
    paletteGenerator = await getColorPalette(
      "assets/images/Screen Shot 2021-12-08 at 13.39 1.png",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 65),
            child: mBottomNavPages[selectedIndex],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.16, 1.0],
                          colors: [
                            HSLColor.fromColor(
                              paletteGenerator!.dominantColor!.color,
                            ).withLightness(0.34).toColor(),
                            Colors.black87,
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              mSpacer(mHeight: 70),
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: SvgPicture.asset(
                                        "assets/svg/Down.svg",
                                        width: 50,
                                      ),
                                    ),
                                    Text(
                                      "1(Remastered)",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Icon(Icons.more_horiz, color: Colors.white),
                                  ],
                                ),
                              ),
                              mSpacer(mHeight: 16),
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(11),
                                  child: Image.asset(
                                    "assets/images/Screen Shot 2021-12-08 at 13.39 2.png",
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      "From Me to You - Mono / Remastered",
                                      maxLines: 1,
                                      softWrap: false,
                                    ),
                                    subtitle: Text("The Beatles"),
                                    titleTextStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.fade,
                                    ),
                                    subtitleTextStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    trailing: Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 26,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                    ),
                                    child: StatefulBuilder(
                                      builder: (_, ss) {
                                        return SliderTheme(
                                          data: SliderThemeData(
                                            overlayShape:
                                                SliderComponentShape.noOverlay,
                                          ),
                                          child: Slider(
                                            activeColor: Colors.white,
                                            thumbColor: Colors.white,
                                            inactiveColor: Colors.grey,
                                            min: 0,
                                            max: 100,
                                            value: currentValue,
                                            onChanged: (value) {
                                              currentValue = value;
                                              ss(() {});
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 16,
                                      right: 16,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "0:30",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "-1:18",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/svg/Shuffle-1.svg",
                                        ),
                                        Icon(
                                          Icons.skip_previous_sharp,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                        StatefulBuilder(
                                          builder: (context, ss) {
                                            return InkWell(
                                              onTap: () {
                                                isPlaying = !isPlaying;
                                                ss(() {});
                                              },
                                              child: Icon(
                                                isPlaying
                                                    ? Icons
                                                          .pause_circle_filled_sharp
                                                    : Icons
                                                          .play_circle_fill_sharp,
                                                color: Colors.white,
                                                size: 77,
                                              ),
                                            );
                                          },
                                        ),
                                        Icon(
                                          Icons.skip_next_sharp,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                        SvgPicture.asset(
                                          "assets/svg/Repeat-1.svg",
                                          color: AppColors.primaryColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        mSpacer(),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.bluetooth,
                                              color: Colors.green,
                                              size: 14,
                                            ),
                                            Text(
                                              "BEATSPILL+",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        SvgPicture.asset(
                                          "assets/svg/Share-1.svg",
                                          width: 25,
                                          height: 25,
                                        ),
                                        mSpacer(mWidth: 30),
                                        Icon(
                                          Icons.playlist_play_sharp,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: EdgeInsets.all(11),
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              height: 70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0XFFD8672A),
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(7),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lyrics",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 7),
                                    width: 88,
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "MORE",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SvgPicture.asset(
                                          "assets/svg/pinch.svg",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: MyCompactMusicPlayerWidget(
                isBluetooth: true,
                bluetoothName: "BEATS PILL+",
                songTitle: "From Me to You - Mono / Remastered",
                albumTitle: "The Beatles",
                bgColor: Color(0XFF550A1C),
                thumbnailPath:
                    "assets/images/Screen Shot 2021-12-08 at 13.39 1.png",
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.blackColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.secondaryBlackColor,
        elevation: 11,
        currentIndex: selectedIndex,
        iconSize: 11,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: AppColors.whiteColor),
        unselectedLabelStyle: TextStyle(color: AppColors.greyColor),
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/Vector-3.png",
              width: 20,
              height: 20,
              color: Colors.grey,
            ),
            label: "Home",
            activeIcon: Image.asset(
              "assets/images/Vector.png",
              width: 20,
              height: 20,
              color: AppColors.whiteColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/Vector-1.png",
              width: 20,
              height: 20,
              color: Colors.grey,
            ),
            label: "Search",
            activeIcon: Image.asset(
              "assets/images/Vector-1.png",
              width: 20,
              height: 20,
              color: AppColors.whiteColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/Vector-2.png",
              width: 20,
              height: 20,
              color: Colors.grey,
            ),
            label: "Library",
            activeIcon: Image.asset(
              "assets/images/Vector-2.png",
              width: 20,
              height: 20,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
