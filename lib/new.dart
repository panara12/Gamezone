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
                              color: Colors.black,
                              fontSize: 23.sp,
                            ),
                            children: [
                      TextSpan(text: 'GAME'),
                      TextSpan(text: "Z", style: TextStyle(color: Colors.red)),
                      TextSpan(text: "ONE")
                    ]))),
              ),
              Container(

                padding: EdgeInsets.only(left: 20.h, top: 40),
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
