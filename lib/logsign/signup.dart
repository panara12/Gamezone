import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      body: Container(
        child: FutureBuilder<String>(
          builder:(context, snapshot) {
            return Text(snapshot.data.toString());
          },
          future: rootBundle.loadString('assets/fromat.json'),
        ),
      ),
    );
  }
}
