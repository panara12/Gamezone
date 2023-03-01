import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;

class Newapi extends StatefulWidget {
  const Newapi({Key? key}) : super(key: key);

  @override
  State<Newapi> createState() => _NewapiState();
}

class _NewapiState extends State<Newapi> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Scaffold(
          body: Container(
              child: FutureBuilder<http.Response>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                ListView.builder(
                  itemCount: jsonDecode(snapshot.data!.body.toString()).length,
                  itemBuilder: (context, index) {
                    return Container(
                        child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 4.w),
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(jsonDecode(
                                        snapshot.data!.body.toString())[index]
                                    ["img"]),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 24.h,
                          ),
                          height: 9.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: Center(
                              child: Row(
                            children: [
                              Text((jsonDecode(snapshot.data!.body.toString())[
                                      index]["Name"])
                                  .toString()),
                              Container(
                                decoration: BoxDecoration(color: Colors.white),
                                child: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    showDeleteAlert(jsonDecode(snapshot
                                        .data!.body
                                        .toString())[index]['id']);
                                  },
                                ),
                                margin: EdgeInsets.only(left: 2.8.w),
                                width: 21.w,
                                height: 9.h,
                              )
                            ],
                          )),
                        ),
                      ],
                    ));
                  },
                ),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
        future: getDatafromserver(),
      )));
    });
  }

  Future<http.Response> getDatafromserver() async {
    var response = await http.get(
        Uri.parse('https://6317993682797be77f012c87.mockapi.io/SmartPhones'));
    print('response ::: $response');
    print(response.body);
    return response;
  }

  Future<http.Response> DeleteUser(id) async {
    var response = await http.delete(Uri.parse(
        'https://6317993682797be77f012c87.mockapi.io/SmartPhones/$id'));
    return response;
  }

  void showDeleteAlert(id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Alert!'),
          content: Text('are you want remove user from list?'),
          actions: [
            TextButton(
              onPressed: () async {
                http.Response res = await DeleteUser(id);
                if (res.statusCode == 200) {
                  setState(() {});
                }
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('NO'),
            )
          ],
        );
      },
    );
  }
}
