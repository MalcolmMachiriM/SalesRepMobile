import 'package:flutter/material.dart';

import '../constants.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    'Disinfectant Care',
    'Catering and Kitchen',
    'Laundry Division',
    'General purpose',
    'Toilet CleaningS'
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: cDefaultPadding / 2),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => buildCategory(index)),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: cDefaultPadding / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ? cTextColor : cTextLightColor),
            ),
            Container(
              height: 2,
              width: 60,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
              margin: const EdgeInsets.only(top: cDefaultPadding / 8),
            )
          ],
        ),
      ),
    );
  }
}
