import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamezone/startpage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class New extends StatelessWidget {
  const New({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, top: 40),
                child: Expanded(
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23.sp,
                            ),
                            children: [
                      TextSpan(text: 'GAME'),
                      TextSpan(text: "Z", style: TextStyle(color: Colors.red)),
                      TextSpan(text: "ONE")
                    ]))),
              ),
              Container(

                padding: EdgeInsets.only(left: 10.h, top: 40),
                child: Icon(
                  Icons.notification_add_outlined,
                  size: 30.px,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 40),
                child: Icon(
                  Icons.person_outline_sharp,
                  size: 30.px,
                ),
              )
            ],
          )),
          Expanded(
              child: Container(
            color: CupertinoColors.systemIndigo,
          )),
          Expanded(
              child: Container(
            color: CupertinoColors.systemPink,
          )),
          Expanded(
              child: Container(
            color: CupertinoColors.extraLightBackgroundGray,
          )),
          Expanded(
              child: Container(
            color: CupertinoColors.activeGreen,
          )),
        ],
      );
    });
  }
}

//
// Align(
// alignment: Alignment.bottomLeft,
// child: Expanded(
// child: Container(
// width: double.infinity,
// child: buildBlur(
// child: Column(
// children: [
// Container(
// color: Colors.white.withOpacity(0.1),
// padding: EdgeInsets.all(5),
// child: RichText(
// text: TextSpan(children: [
// TextSpan(
// text:
// 'Marvel\'s Spider-Man : Miles Morales',
// style: TextStyle(
// color: Colors.white,
// fontFamily: 'Nunito',
// fontSize: 20.sp,
// )),
// TextSpan(
// text:
// 'In the latest adventure in the Marvel\'s Spider-Man\n'
// 'universe. teenage Miles Morales is adjusting to his\n'
// 'new home while following in the footsteps of his\n'
// 'mentor. Peter Parker, as a new Spider-Man. But when\n'
// 'a fierce power struggle threatens to destroy his new\n'
// 'home, the aspiring hero realizes that with great\n'
// 'power, there must also come great responsibility.\n',
// style: TextStyle(
// color: Colors.white,
// fontFamily: 'Nunito',
// fontSize: 15.sp,
// )),
// ]))),
// Container(
// child: InkWell(
// child: Icon(
// Icons.arrow_downward,
// ),
// ),
// color: Colors.white.withOpacity(0.1),
// width: double.infinity,
// )
// ],
// ),
// ),
// ),
// ),
// ),