import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamezone/api/apicall.dart';
import 'package:gamezone/startpage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;

import '../api/newuser.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var nameControler = TextEditingController();
  var makerControler = TextEditingController();
  var e = 'ready';
  var formKey = GlobalKey<FormState>();

  void login(String SmartPhoneName,SmartPhoneMaker) async{
    try{
      http.Response res = await http.post(
        Uri.parse('https://6317993682797be77f012c87.mockapi.io/SmartPhones'),
          body: {
          "SmartPhoneName" : SmartPhoneName,
            "SmartPhoneMaker" : SmartPhoneMaker
          }
      );
      if(res.statusCode == 200){
        print('seccess');
      }
      else{
        print('failed');
      }
      }
    catch(e){
      print(e.toString());
    };
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return FutureBuilder<http.Response>(
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return Scaffold(
                body: Stack(
                  children: [
                    Container(
                      height: 100.h,
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
                    ),
                    Form(
                      key: formKey,
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.all(5.h),
                          color: Colors.white,
                          height: 50.h,
                          width: 75.w,
                          child: Column(children: [
                            Text(
                              'Log In',
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5.h),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'enter email ',
                                    labelStyle: TextStyle(fontWeight: FontWeight.w600),
                                    border: OutlineInputBorder()),
                                controller: nameControler,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5.h),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'enter password',
                                    labelStyle: TextStyle(fontWeight: FontWeight.w600),
                                    border: OutlineInputBorder()),
                                controller: makerControler,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                login(nameControler.text.toString(), makerControler.text.toString());
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 2.h),
                                child: TextButton(
                                  onPressed : () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                      return Startpage();
                                    },));
                                  },
                                  child: Text(
                                    'Enter',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStatePropertyAll(Colors.black38)),
                                ),
                              ),
                            ),
                            Container(
                              child: InkWell(
                                child: TextButton(
                                    onPressed: () {}, child: Text('Forgot Password ?')),
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Don\'t have account ?'),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                                        return Newuser();
                                      },));
                                    },
                                    child: Text('Sing Up?',style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
            else{
              return CircularProgressIndicator();
            }
          },
        future: getDatafromserver(),
      );
    });
  }
  Future<http.Response> getDatafromserver() async {
    var response = await http.get(
        Uri.parse('https://6317993682797be77f012c87.mockapi.io/SmartPhones'));
    print('response ::: $response');
    print(response.body);
    return response;
  }

}
