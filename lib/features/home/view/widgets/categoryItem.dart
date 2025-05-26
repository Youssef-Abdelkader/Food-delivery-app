import 'package:flutter/material.dart';

import '../../../../data/models/Category.dart';


class CategoryItemWidget extends StatelessWidget {
  Category category;
   VoidCallback onTap;
  CategoryItemWidget({super.key, required this.category,    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("print Tapped category: ${category.strCategory}"); // Add this

        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                //isSelected ? Color(0xffA0EACF) : Colors.white,
              ),
              padding: EdgeInsets.all(10),
              child: Image.network(
                category.strCategoryThumb,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 5),
            Text(category.strCategory
              ,
              style: TextStyle(
                color: Color(0xff333333),
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
