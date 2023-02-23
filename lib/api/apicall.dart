import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Apicall extends StatefulWidget {
  const Apicall({Key? key}) : super(key: key);

  @override
  State<Apicall> createState() => ApicallState();
}

class ApicallState extends State<Apicall> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<http.Response>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
                    return
                        ListView.builder(
                          itemCount: jsonDecode(snapshot.data!.body.toString()).length,
                          itemBuilder: (context, index) {
                          return Card(
                            child: Container(
                              child: Column(children: [
                                Text((jsonDecode(snapshot.data!.body.toString())[index]['username']).toString(),style: TextStyle(
                                  fontSize: 20
                                ),),
                                Text((jsonDecode(snapshot.data!.body.toString())[index]['region']).toString(),style: TextStyle(
                                    fontSize: 15
                                ),)
                              ]),
                            ),
                          );
                        },);
            } else {
              return CircularProgressIndicator();
            }
          },
          future: getDatafromserver(),
        ),
      ),
    );
  }
  
  Future<http.Response> getDatafromserver() async {
    var response = await http.get(Uri.parse('https://6317993682797be77f012c87.mockapi.io/faculty'));
    Map map = {};
    map['Email'] = "abc";
    map['region']= "india";

    var response1= await http.post(Uri.parse('https://6317993682797be77f012c87.mockapi.io/faculty'));
    print('response1 ::: $response1');
    return response;
  }
}


