import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamezone/startpage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [

              //frist text and icons

              Container(
                padding: EdgeInsets.only(left: 30,top: 40),
                child: Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 28,
                      ),
                      children: [
                        TextSpan(text: 'GAME'),
                        TextSpan(text: "Z",style: TextStyle(color: Colors.red)),
                        TextSpan(text: "ONE")
                      ]
                    )
                  )),
              ),
              Container(
                padding: EdgeInsets.only(top: 40,left: 90),
                  child: IconButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return Startpage();
                    },));
                  }, icon: Icon(Icons.notification_add_outlined))
              ),
              Container(
                  padding: EdgeInsets.only(top: 40,left: 2),
                  child: IconButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return Startpage();
                    },));
                  }, icon: Icon(Icons.person_outline_sharp))
              )
            ],
          ),

          //searchbar

          Container(
            padding: EdgeInsets.all(24),
              child: TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 18
                ),
                prefixIcon: Container(
                padding: EdgeInsets.all(15),
                  child: Icon(Icons.search_outlined,color: Colors.black45),
                )))),

          //frist img

          Column(
              children: [
                Container(
                  child: Text("Top Games", style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ]),
          //last navbar
          Container(
              child: GNav(
                tabs: [
                  GButton(icon: Icons.home),
                  GButton(icon: Icons.favorite),
                  GButton(icon: Icons.settings),
                ],
              )
          )
        ],
      ),
    );
  }
}
