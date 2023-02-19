import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'MHome/home.dart';

class Startpage extends StatelessWidget {
  const Startpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Scaffold(
        body: Column(
          children: [
            Expanded(
                child: ImageSlideshow(
              indicatorRadius: 3,
              indicatorColor: Colors.white,
              indicatorBackgroundColor: Colors.white38,
              children: [
                Image.asset(
                  'assets/squid.png',
                  fit: BoxFit.fitWidth,
                ),
                Image.asset(
                  'assets/pubg.png',
                  fit: BoxFit.fitHeight,
                ),
                Image.asset(
                  'assets/witch.png',
                  fit: BoxFit.fitWidth,
                ),
              ],
              autoPlayInterval: 4000,
              isLoop: true,
            )),
            Container(
                padding: EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 35),
                      child: Center(
                        child: Text(
                          'Play your favourite\n   character game',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 145.0,
                      height: 50.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        child: Text('Enter'),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return HomePage();
                            },
                          ));
                        },
                      ),
                    ),
                  ],
                ))
          ],
        ),
      );
    });
  }
}
