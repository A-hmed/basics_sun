import 'package:basics_sun_c11/model/category_dm.dart';
import 'package:basics_sun_c11/screens/home/category.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class Home extends StatelessWidget {
  static const String routeName = "home";
  List<CategoryDM> categories = [
    CategoryDM(title: "cars", imagePath: "assets/car.jpg"),
    CategoryDM(title: "test", imagePath: "assets/car.jpg"),
    CategoryDM(title: "1", imagePath: "assets/car.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Title",
          style: TextStyle(fontSize: 18, color: Colors.redAccent),
        ),
        elevation: 0,
        actions: [Icon(Icons.call), Icon(Icons.arrow_back)],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    color: purple,
                    child: Text(
                      "Magazine",
                      style: defaultStyle,
                      textAlign: TextAlign.center,
                    )),
              ),
              Container(
                width: 4,
              ),
              Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    color: Colors.red,
                    child: Text("News",
                        style: defaultStyle, textAlign: TextAlign.center)),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: myItemBuilder,
            ),
          )
        ],
      ),
    );
  }

  Widget myItemBuilder(BuildContext context, int index) {
    return Category(
      categoryDM: categories[index],
    );
  }
}
