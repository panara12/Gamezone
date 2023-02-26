import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gamezone/api/updateuser.dart';
import 'package:gamezone/api/newuser.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';

class Apicall extends StatefulWidget {
  const Apicall({Key? key}) : super(key: key);

  @override
  State<Apicall> createState() => ApicallState();
}

class ApicallState extends State<Apicall> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType)
    {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Center(
            child: Text('Other Users',
                style: TextStyle(
                  fontSize: 20.sp,
                )),
          ),
          actions: [
            InkWell(
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 30,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return Newuser();
                  },
                )).then((value) {
                  if (value == true) {
                    setState(() {});
                  }
                });
              },
            )
          ],
        ),
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
          child: FutureBuilder<http.Response>(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children: [
                    ListView.builder(
                      itemCount:
                      jsonDecode(snapshot.data!.body.toString()).length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return Updateuser(jsonDecode(
                                    snapshot.data!.body.toString())[index]);
                              },
                            )).then((value) {
                              if (value == true) {
                                setState(() {});
                              }
                            });
                          },
                          child: Card(
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                          image: NetworkImage(jsonDecode(snapshot.data!.body.toString())[index]["img"]),
                                          fit: BoxFit.fitHeight
                                      )
                                  ),
                                  height: 7.h,
                                  width: 50,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          (jsonDecode(snapshot.data!.body
                                              .toString())[index]
                                          ["Name"])
                                              .toString(),
                                          style: TextStyle(fontSize: 18.sp,color: Colors.white),
                                        ),
                                        Text(
                                          (jsonDecode(snapshot.data!.body
                                              .toString())[index]
                                          ["Email"])
                                              .toString(),
                                          style: TextStyle(fontSize: 15.sp,color: Colors.white),
                                        ),
                                      ]),
                                ),
                                InkWell(
                                  child: Icon(
                                    Icons.delete_outline_outlined,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    showDeleteAlert(jsonDecode(
                                        snapshot.data!.body.toString())[index]
                                    ['id']);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            },
            future: getDatafromserver(),
          ),
        ),
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
