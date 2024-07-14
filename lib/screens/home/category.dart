import 'package:basics_sun_c11/model/category_dm.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class Category extends StatelessWidget {
  final CategoryDM categoryDM;
  final Color bg;

  const Category({super.key, required this.categoryDM, this.bg = purple});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Image.asset(categoryDM.imagePath),
        Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Text(
              categoryDM.title,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ))
      ],
    );
  }
}
