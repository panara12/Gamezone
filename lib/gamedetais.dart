import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'dart:ui';
import 'package:responsive_sizer/responsive_sizer.dart';

class Games extends StatefulWidget {
  const Games({Key? key}) : super(key: key);

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Stack(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(
                  'assets/spider.png',
                ),
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Expanded(
                      child: Container(
                        width: double.infinity,
                        child: buildBlur(
                          child: Column(
                            children: [
                              Container(
                                  color: Colors.white.withOpacity(0.1),
                                  padding: EdgeInsets.all(5),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text:
                                            'Marvel\'s Spider-Man : Miles Morales',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Nunito',
                                          fontSize: 20.sp,
                                        )),
                                    TextSpan(
                                        text:
                                            'In the latest adventure in the Marvel\'s Spider-Man\n'
                                            'universe. teenage Miles Morales is adjusting to his\n'
                                            'new home while following in the footsteps of his\n'
                                            'mentor. Peter Parker, as a new Spider-Man. But when\n'
                                            'a fierce power struggle threatens to destroy his new\n'
                                            'home, the aspiring hero realizes that with great\n'
                                            'power, there must also come great responsibility.\n',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Nunito',
                                          fontSize: 15.sp,
                                        )),
                                  ]))),
                              Container(
                                child: InkWell(
                                  child: Icon(
                                    Icons.arrow_downward,
                                  ),
                                ),
                                color: Colors.white.withOpacity(0.1),
                                width: double.infinity,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GNav(
                    mainAxisAlignment: MainAxisAlignment.center,
                    tabs: [
                      GButton(
                          icon: Icons.shopping_basket_outlined,
                          text: 'Buy Now'),
                    ],
                    backgroundColor: Colors.white,
                  )
                ],
              ),
            ],
          ),
        ],
      );
    });
  }

  Widget buildBlur({
    required Widget child,
    double sigmaX = 5,
    double sigmaY = 5,
  }) =>
      ClipRRect(
        child: BackdropFilter(
          child: child,
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        ),
        borderRadius: BorderRadius.zero,
      );
}
