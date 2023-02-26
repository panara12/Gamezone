import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;

import 'apicall.dart';

class Newuser extends StatefulWidget {

  @override
  State<Newuser> createState() => _NewuserState();
}

class _NewuserState extends State<Newuser> {

  var formKey = GlobalKey<FormState>();

  var nameControler = TextEditingController();

  var emailControler = TextEditingController();

  var phoneControler = TextEditingController();
  var imgControler = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Scaffold(
        body: SafeArea(
          child: Container(
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

            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10.h,),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          child: Center(
                            child: Container(
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(imgControler.text),
                                radius: 17.h,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.h,left: 2.w,right: 2.w),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(labelText: 'enter new name'),
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return "enter valid name";
                                  }
                                },
                                controller: nameControler,
                              ),
                              SizedBox(height: 2.h,),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'enter new email'),
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return "enter valid email";
                                  }
                                },
                                controller: emailControler,
                              ),
                              SizedBox(height: 2.h,),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'enter new img url'),
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return "enter valid url";
                                  }
                                },
                                controller: imgControler,
                              ),
                              SizedBox(height: 2.h,),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'enter new phone no'),
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return "enter valid phone";
                                  }
                                },
                                controller: phoneControler,
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 3.h),
                                child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll(Colors.black)
                                    ),
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        insertUser().then((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Apicall()),));
                                      }
                                    },
                                    child: Text('submit',style: TextStyle(color: Colors.white,fontSize: 18.sp),)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
  Future<void> insertUser() async {
    Map map = {};
    map["Name"] = nameControler.text;
    map["Email"] = emailControler.text;
    map["phone"] = phoneControler.text;
    map["img"] = imgControler.text;
    var response1 = await http.post(
        Uri.parse('https://6317993682797be77f012c87.mockapi.io/SmartPhones'),body: map);
    print(imgControler.text);
    print(response1.body);
  }
}