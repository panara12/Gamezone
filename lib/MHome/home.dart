import 'package:flutter/material.dart';
import 'package:gamezone/api/apicall.dart';
import 'package:gamezone/logsign/login.dart';
import 'package:gamezone/MHome/spiderdetails.dart';
import 'package:gamezone/startpage.dart';
import 'package:gamezone/MHome/witch.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../api/newuser.dart';
import '../logsign/myprofile.dart';
import 'Captain.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

TextEditingController searchController = TextEditingController();

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType)
    {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 110.w,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 60),
                        child: Expanded(
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30
                                    ),
                                    children: [
                                      TextSpan(text: 'GAME',style: TextStyle(color: Colors.black)),
                                      TextSpan(text: "Z", style: TextStyle(color: Colors.red)),
                                      TextSpan(text: "ONE",style: TextStyle(color: Colors.black))
                                    ]))),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 13.h,top: 60),
                        child: Icon(
                          Icons.notification_add_outlined,
                          size: 30,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12,top: 60),
                        child: IconButton(
                          icon: Icon(Icons.person_outline_sharp,size: 33,),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return Login();
                            },));
                          },
                        ),
                      )
                    ],
                  )
              ),
              Container(
                margin: EdgeInsets.only(top: 4.h),
                height: 5.h,
                width: 85.w,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 5.0,
                        spreadRadius: 0.5,
                        offset: Offset(2, 3)
                    ),],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),

                ),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search,color: Colors.grey)
                  ),
                ),
              ),

              //Top game

              Container(
                margin: EdgeInsets.only(bottom: 1.h),
                height: 7.h,
                width: double.infinity,
                child: Container(
                  margin: EdgeInsets.only(top: 2.h),
                  padding: EdgeInsets.only(right: 55.w),
                  height: 5.h,
                  width: double.infinity,

                  child: Center(child: Text("Top Games",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),)),
                ),
              ),

              //Image Conatainer

              Container(
                height: 35.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.h,bottom: 1.h,right: 1.h),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return spiderdetails();
                          },));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 4.w),
                          width: 60.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/imgs/spider.png'),
                              )),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 24.h,),
                                height: 9.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                ),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Text('Marvel\'s Spider-Man\n Miles Morales'),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white
                                        ),
                                        child: IconButton(
                                         icon: Icon(Icons.shopping_basket_outlined), onPressed: () {},),
                                        margin: EdgeInsets.only(left: 2.8.w),
                                        width: 21.w,
                                        height: 9.h,
                                      )
                                    ],
                                  )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.h,bottom: 1.h,right: 1.h),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return Captaindetails();
                          },));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 4.w),
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/imgs/Captain.png'),
                              )),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 24.h),
                                height: 9.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                ),
                                child: Center(
                                    child: Row(
                                      children: [
                                        Text('Marvel\'s\n CaptainAmerica'),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white
                                          ),
                                          child: IconButton(onPressed: () {
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                              return spiderdetails();
                                            },));
                                          }, icon: Icon(Icons.shopping_basket_outlined)),
                                          margin: EdgeInsets.only(left: 11.3.w),
                                          width: 19.w,
                                          height: 9.h,
                                        )
                                      ],
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.h,bottom: 1.h,right: 1.h),
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return witchetails();
                          },));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 4.w),
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/imgs/witch.png'),
                              )),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 24.h),
                                height: 9.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                ),
                                child: Center(
                                    child: Row(
                                      children: [
                                        Text('ClashRoyel Game \n Suppeshell'),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white
                                          ),
                                          child: IconButton(onPressed: () => Startpage(), icon: Icon(Icons.shopping_basket_outlined)),
                                          margin: EdgeInsets.only(left: 6.7.w),
                                          width: 21.w,
                                          height: 9.h,
                                        )
                                      ],
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.h,bottom: 1.h,right: 1.h),
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return spiderdetails();
                          },));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 4.w),
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/imgs/spider.png'),
                              )),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 24.h),
                                height: 9.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                ),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Text('Marvel\'s Spider-Man\n Miles Morales'),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white
                                        ),
                                        child: IconButton(onPressed: () => Startpage(), icon: Icon(Icons.shopping_basket_outlined)),
                                        margin: EdgeInsets.only(left: 2.8.w),
                                        width: 21.w,
                                        height: 9.h,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                height: 7.h,
                width: double.infinity,
                child: Container(
                  margin: EdgeInsets.only(top: 2.h),
                  padding: EdgeInsets.only(right: 32.w),
                  height: 5.h,
                  width: double.infinity,

                  child: Center(child: Text("Popular Categories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 2.h),
                height: 18.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.h,bottom: 1.h,right: 1.h),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){},
                            child: Container(
                              height: 10.h,
                              margin: EdgeInsets.only(left: 4.w),
                              padding: EdgeInsets.only(left: 1.w),
                              width: 25.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  image: DecorationImage(image: AssetImage('assets/imgs/volly.png'),fit: BoxFit.fitWidth)
                              ),
                            ),
                          ),
                          Text('Sports')
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.h,bottom: 1.h,right: 1.h),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){},
                            child: Container(
                              height: 10.h,
                              margin: EdgeInsets.only(left: 4.w),
                              padding: EdgeInsets.only(left: 1.w),
                              width: 25.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                image: DecorationImage(image: AssetImage('assets/imgs/Gun.png'),fit: BoxFit.fitWidth)
                              ),
                            ),
                          ),
                          Text('FPS')
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.h,bottom: 1.h,right: 1.h),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){},
                            child: Container(
                              height: 10.h,
                              margin: EdgeInsets.only(left: 4.w),
                              padding: EdgeInsets.only(left: 1.w),
                              width: 25.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  image: DecorationImage(image: AssetImage('assets/imgs/volly.png'),fit: BoxFit.fitWidth)
                              ),
                            ),
                          ),
                          Text('Sports')
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.h,bottom: 1.h,right: 1.h),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){},
                            child: Container(
                              height: 10.h,
                              margin: EdgeInsets.only(left: 4.w),
                              padding: EdgeInsets.only(left: 1.w),
                              width: 25.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  image: DecorationImage(image: AssetImage('assets/imgs/action.png'),fit: BoxFit.fitWidth)
                              ),
                            ),
                          ),
                          Text('Action')
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //Last navbar


              Container(
                height: 8.h,
                width: double.infinity,

                child: Row(
                  children: [
                    SizedBox(width: 8.w),
                    Container(
                      height: 5.h,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ), onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                return Myprofile();
                              },));
                          },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      height: 5.h,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.add_circle,
                              color: Colors.black,
                            ), onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                return Apicall();
                              },));
                          },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      height: 5.h,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.bookmark,
                              color: Colors.black,
                            ), onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      height: 5.h,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.black,
                            ), onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                return Newuser();
                              },));
                          },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      height: 5.h,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.settings,
                              color: Colors.black,
                            ), onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}