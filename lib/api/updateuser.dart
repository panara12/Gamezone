import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';

class Updateuser extends StatefulWidget {

  Updateuser(this.map);
  Map? map;

  @override
  State<Updateuser> createState() => _UpdateuserState();
}

class _UpdateuserState extends State<Updateuser> {
  var formKey = GlobalKey<FormState>();

  var nameControler = TextEditingController();

  var emailControler = TextEditingController();

  var phoneControler = TextEditingController();
  var imgControler = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameControler.text = widget.map==null?'':widget.map!['Name'];
    emailControler.text = widget.map==null?'':widget.map!['Email'];
    phoneControler.text = widget.map==null?'':widget.map!['phone'];
    imgControler.text = widget.map==null?'':widget.map!['img'];
  }

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
                                        updateUser(widget.map!['id']).then((value) => Navigator.of(context).pop(true));
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

  Future<void> updateUser(id) async {
    Map map = {};
    map["Name"] = nameControler.text;
    map["Email"] = emailControler.text;
    map["phone"] = phoneControler.text;
    var response1 = await http.put(
        Uri.parse('https://6317993682797be77f012c87.mockapi.io/SmartPhones/$id'),body: map);
    print(response1.body);
  }
}
