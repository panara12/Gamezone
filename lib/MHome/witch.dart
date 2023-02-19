import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:responsive_sizer/responsive_sizer.dart';

class witchetails extends StatefulWidget {
  const witchetails({Key? key}) : super(key: key);

  @override
  State<witchetails> createState() => _GamesState();
}

class _GamesState extends State<witchetails> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: 190.w,
                    color: Colors.white,
                    child: Image(image: AssetImage('assets/witch.png'),
                      width: 100.w,
                      fit: BoxFit.fitHeight,
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 480),
                  child: Container(
                      color: Colors.black38,
                      height: 250,
                      child: Column(
                        children: [
                          Text('ClashRoyel Game from Supershell',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Nunito',
                              color: Colors.white,
                              fontSize: 19.sp,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Text(
                              'In the latest adventure in the Marvel\'s Spider-Man '
                                  'universe. teenage Miles Morales is adjusting to his '
                                  'new home while following in the footsteps of his '
                                  'mentor. Peter Parker, as a new Spider-Man. But when '
                                  'a fierce power struggle threatens to destroy his new '
                                  'home, the aspiring hero realizes that with great '
                                  'power, there must also come great responsibility.',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Nunito',
                                color: Colors.white,
                                fontSize: 16.sp,
                                decoration: TextDecoration.none,
                              )
                          ),
                          Center(child: Icon(Icons.arrow_downward, size: 40,
                            color: Colors.white,),)
                        ],
                      )
                  ),
                ),
              ],
            ),
            Container(
              height: 20.w,
              color: Colors.white,
              child: Center(
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      elevation: MaterialStatePropertyAll(0)
                  ),
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_basket_outlined,
                    size: 24.0,
                    color: Colors.black,
                  ),
                  label: Text('Buy Now',
                      style: TextStyle(color: Colors.black)), // <-- Text
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
