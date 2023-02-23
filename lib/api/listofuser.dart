import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamezone/api/userinfopage.dart';
import 'package:gamezone/database.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;

class Listofuser extends StatefulWidget {
  const Listofuser({Key? key}) : super(key: key);

  @override
  State<Listofuser> createState() => _ListofuserState();
}

class _ListofuserState extends State<Listofuser> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Scaffold(
        body: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 10.h,
              color: Colors.orange,
              child: Center(
                child: Text('Other Users',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            FutureBuilder<http.Response>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return
                    Expanded(
                      child: ListView.builder(
                        itemCount: jsonDecode(snapshot.data!.body.toString()).length,
                        itemBuilder: (context, index) {
                          return InkWell(
                           // onTap: Navigator.of(context).push(MaterialPageRoute(builder: (index) => ProfilePage(key: ValueKey(index)),)),
                            child: Card(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                      Text((jsonDecode(snapshot.data!.body.toString())[index]['username']).toString(),style: TextStyle(
                                          fontSize: 20.sp
                                      ),),
                                      Text((jsonDecode(snapshot.data!.body.toString())[index]['region']).toString(),style: TextStyle(
                                          fontSize: 15.sp,
                                        color: Colors.grey
                                      ),)
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },),
                    );
                } else {
                  return CircularProgressIndicator();
                }
              },
              future: getDatafromserver(),
            ),
          ],
        ),
      );
    });
  }
  Future<http.Response> getDatafromserver() async {
    var response = await http.get(Uri.parse('https://6317993682797be77f012c87.mockapi.io/faculty'));
    print(response.body.toString());
    return response;
  }
}
