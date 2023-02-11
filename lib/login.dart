import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Scaffold(
        backgroundColor: Colors.blue,
        // appBar: AppBar(
        //   elevation: 0,
        //   centerTitle: true,
        //   title: Text(
        //     "Login",
        //     style: TextStyle(fontSize: 18.sp, fontFamily: "Nunito"),
        //   ),
        // ),
        body: Column(children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.only(top: 20.h),
            color: Colors.blue,
            child: Center(
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: 25.sp, color: Colors.white, fontFamily: "Nunito"),
              ),
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                color: Colors.blue,
                child: Container(
                  height: 15.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.sp)),
                  child: SingleChildScrollView(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                      height: 50.h,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Expanded(child: TextFormField()),
                          Expanded(child: TextFormField()),
                          Expanded(
                              child: InkWell(
                            onTap: () {},
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: Colors.blue),
                                child: Center(child: Text("Login"))),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ]),
      );
    });
  }
}
