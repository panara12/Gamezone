import 'package:flutter/material.dart';
import 'database.dart';
import 'package:text_scroll/text_scroll.dart';

class Databasecall extends StatefulWidget {
  const Databasecall({Key? key}) : super(key: key);

  @override
  State<Databasecall> createState() => _DatabasecallState();
}

class _DatabasecallState extends State<Databasecall> {

  var db = new MyDatabase();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: db.getDataFromUsersTable("tabEmployee"),
        initialData: [],
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (_, int position) {
              final item = snapshot.data?[position];
              //get your item data here ...
              return Card(
                child: ListTile(
                  title: Text(
                      "Employee Name: " + snapshot.data?[position].row[1]),
                ),
              );
            },
          )
              : Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
