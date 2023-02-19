import 'package:flutter/material.dart';
import 'package:gamezone/model/model.dart';
import 'package:gamezone/new.dart';

import '../database.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('user list'),
          actions: [
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return New();
                },));
              },
              child: Icon(Icons.add),
            )
          ],
        ),
        body: FutureBuilder<List<Loginmodel>>(
          builder: (context, snapshot) {
            if (snapshot != null && snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      children: [
                        Text(snapshot.data![index].Emails.toString()),
                        Container(width: 10),
                        Text(snapshot.data![index].password.toString())
                      ],
                    ),
                  );
                },
                itemCount: snapshot.data!.length,
              );
            } else {
              return Center(
                child: Text('user nott found'),
              );
            }
          },
          future: Userlist().GetDataFromUser(),
        ));
  }
}
