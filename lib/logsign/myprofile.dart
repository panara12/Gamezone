import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Myprofile extends StatelessWidget {
  const Myprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Scaffold(
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.grey,
                    ],
                    stops: [
                      0.0,
                      1.0
                    ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    tileMode: TileMode.repeated)),
            child: Column(
              children: [
                SizedBox(height: 14.h,),
                Center(
                  child: Container(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/imgs/login.png'),
                      radius: 17.h,
                    ),
                  ),
                ),
                SizedBox(height: 5.h,),
                Container(
                  width: 80.w,
                  height: 30.h,
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 12),
                          child: Row(
                            children: [
                              SizedBox(width: 2.w,),
                              Text("Name  :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp)),
                              SizedBox(width: 4.w,),
                              Text("User of app",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp)),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 12),
                          child: Row(
                            children: [
                              SizedBox(width: 2.w,),
                              Text("Email  :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp)),
                              SizedBox(width: 4.w,),
                              Text("abhchbc@gmail.com",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 12),
                          child: Row(
                            children: [
                              SizedBox(width: 2.w,),
                              Text("phone  :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp)),
                              SizedBox(width: 4.w,),
                              Text("41668461656",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: TextButton(
                              onPressed: () {}, 
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Colors.black)
                              ),
                              child: Text("log out",style: TextStyle(color: Colors.white,fontSize: 25),)),
                        )
                      ],
                    ),
                  )
                )
              ],
            ),
          ));
    });
  }
}
