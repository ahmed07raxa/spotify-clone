import 'package:flutter/material.dart';

import '../../../domain/app_colors.dart';
import '../../../domain/ui_helper.dart';
import '../../widgets/album_row_widget.dart';

class SearchBottomNav extends StatefulWidget {
  const SearchBottomNav({super.key});

  @override
  State<SearchBottomNav> createState() => _SearchBottomNavState();
}

class _SearchBottomNavState extends State<SearchBottomNav> {
  List<Map<String, dynamic>> mTopGenreList = [
    {
      "imgPath": "assets/images/Screen Shot 2021-12-08 at 13.39 2.png",
      "name": "Pop",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-08 at 14.16 1.png",
      "name": "Indie",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-08 at 13.39 2.png",
      "name": "Pop",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-08 at 13.39 2.png",
      "name": "Indie",
    },
  ];
  List<Map<String, dynamic>> mPodcastList = [
    {
      "imgPath": "assets/images/Screen Shot 2021-12-08 at 14.33 1.png",
      "name": "News & Politics",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-08 at 14.18 1.png",
      "name": "Comedy",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-08 at 14.33 1.png",
      "name": "News & Politics",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-08 at 14.18 1.png",
      "name": "Comedy",
    },
  ];
  List<Map<String, dynamic>> mBrowseList = [
    {
      "imgPath": "assets/images/Screen Shot 2021-12-07 at 14.11 1.png",
      "name": "2021 Wrapped",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-07 at 12.39 1.png",
      "name": "Podcasts",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-07 at 14.17 1.png",
      "name": "Made for you",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-07 at 14.22 1.png",
      "name": "Made for you",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-07 at 14.11 1.png",
      "name": "2021 Wrapped",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-07 at 12.39 1.png",
      "name": "Podcasts",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-07 at 14.17 1.png",
      "name": "Made for you",
    },
    {
      "imgPath": "assets/images/Screen Shot 2021-12-07 at 14.22 1.png",
      "name": "Made for you",
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
              titleUi(),
              mSpacer(mHeight: 14),
              searchBarUi(),
              mSpacer(mHeight: 14),
              topGenres(),
              mSpacer(mHeight: 14),
              popularPodcasts(),
              mSpacer(mHeight: 14),
              browseAll(),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleUi() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11),
      child: Row(
        children: [
          Text(
            "Search",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Icon(Icons.camera_alt_outlined, color: Colors.white, size: 30),
        ],
      ),
    );
  }

  Widget searchBarUi() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        child: TextField(
          cursorColor: AppColors.primaryColor,
          autofocus: false,
          decoration: InputDecoration(
            hintText: "Artists, songs, or podcasts",
            hintStyle: TextStyle(color: Colors.black),
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.search, color: Colors.black),
            ),
            prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget topGenres() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top genres",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          mSpacer(),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: mTopGenreList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 11),
                  child: AlbumRowWidget(
                    thumbnailPath: mTopGenreList[index]['imgPath'],
                    albumName: mTopGenreList[index]['name'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget popularPodcasts() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular podcast categories",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          mSpacer(),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: mPodcastList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 11),
                  child: AlbumRowWidget(
                    thumbnailPath: mPodcastList[index]['imgPath'],
                    albumName: mPodcastList[index]['name'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget browseAll() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Browse all",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          mSpacer(),
          GridView.builder(
            itemCount: mBrowseList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 16 / 9,
              mainAxisSpacing: 11,
              crossAxisSpacing: 11,
            ),
            itemBuilder: (_, index) {
              return AlbumRowWidget(
                thumbnailPath: mBrowseList[index]['imgPath'],
                albumName: mBrowseList[index]['name'],
              );
            },
          ),
        ],
      ),
    );
  }
}
