import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManuallyControlledSlider extends StatefulWidget {

  @override
  State<ManuallyControlledSlider> createState() => _ManuallyControlledSliderState();
}

class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
  List<String> images = [
    'assets/spider.png',
    'assets/pubg.png',
    'assets/witch.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(50),
              child: PageView.builder(
                itemCount: images.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 350,
                      width: 100,
                      child: Image.asset(
                          images[index],
                        fit: BoxFit.cover,
                      )
                      );
                  },
              ),
            ),
        ],
      ),
    );
  }
}
