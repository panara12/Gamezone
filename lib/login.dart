import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamezone/home.dart';
import 'package:gamezone/startpage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _mc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
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
            Align(
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
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(fontWeight: FontWeight.w600),
                          hintText: 'abc@gmail.com',
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5.h),
                    child: TextFormField(
                      controller: _mc,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(fontWeight: FontWeight.w600),
                          hintText: 'w2E%rf34w',
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 2.h),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ));
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
                          child: Text('Sing Up?',style: TextStyle(
                            fontWeight: FontWeight.bold
                          )),
                        )
                      ],
                    ),
                    ),
                ]),
              ),
            )
          ],
        ),
      );
    });
  }
}
