import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamezone/gamedetais.dart';
import 'package:gamezone/startpage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'assets/spider.png',
  'assets/pubg.png',
  'assets/witch.png'
];

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                //frist text and icons

                Container(
                  padding: EdgeInsets.only(left: 10, top: 40),
                  child: Expanded(
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 23.sp,
                              ),
                              children: [
                        TextSpan(text: 'GAME'),
                        TextSpan(
                            text: "Z", style: TextStyle(color: Colors.red)),
                        TextSpan(text: "ONE")
                      ]))),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40, left: 100),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return Startpage();
                                  },
                                ));
                              },
                              icon: Icon(Icons.notification_add_outlined))),
                    ),
                    Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(top: 40, left: 2),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return Startpage();
                                },
                              ));
                            },
                            icon: Icon(Icons.person_outline_sharp)))
                  ],
                )
              ],
            ),

            //searchbar

            Container(
                padding: EdgeInsets.all(24),
                child: TextField(
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        hintText: 'Search',
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 18.sp),
                        prefixIcon: Container(
                          padding: EdgeInsets.all(15),
                          child: Icon(Icons.search_outlined,
                              color: Colors.black45),
                        )))),

            //frist img

            Column(children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(bottom: 14),
                child: Text(
                  "Top Games",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito',
                      fontSize: 17
                  ),
                ),
              ),
              Container(
                height: 32.h,
                width: 100.w,
                child: CarouselSlider(
                  items: imgList
                      .map((e) => Container(
                            width: 100.w,
                            child: Center(
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                child: Image.asset(
                                  e,
                                  width: 100.w,
                                  height: 30.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                      aspectRatio: 1.0,
                      enlargeCenterPage: true,
                      autoPlay: true),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  'Popular Categories',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                  ),
                ),
              ),
              Row(
                children: [
                        Card(
                          child: Container(
                            margin: EdgeInsets.only(left: 20, right: 30),
                            width: 16.w,
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return Startpage();
                                    },
                                  ));
                                },
                                child: ImageIcon(
                                  AssetImage('assets/img.png'),
                                  size: 19,
                                )),
                          ),),

                        Card(
                          child: Container(
                            margin: EdgeInsets.only(left: 20, right: 30),
                            width: 16.w,
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return Startpage();
                                    },
                                  ));
                                },
                                child: ImageIcon(AssetImage('assets/pubg.png'))),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 30),
                          width: 16.w,
                          child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return Startpage();
                                  },
                                ));
                              },
                              child: ImageIcon(AssetImage('assets/pubg.png'))),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 30),
                          width: 16.w,
                          child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return Startpage();
                                  },
                                ));
                              },
                              child: ImageIcon(AssetImage('assets/pubg.png'))),
                        ),
            ]),

            //last navbar
            Container(
                padding: EdgeInsets.only(top: 40),
                child: GNav(
                  tabs: [
                    GButton(icon: Icons.videogame_asset_outlined),
                    GButton(icon: Icons.meeting_room_rounded),
                    GButton(icon: Icons.add_circle),
                    GButton(icon: Icons.settings),
                  ],
                ))
          ]),
        ]),
      );
    });
  }
}
