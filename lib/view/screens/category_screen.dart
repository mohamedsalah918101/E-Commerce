import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/category/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(left: 15, top: 15, right: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: TextUtils(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  text: 'Category',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20,),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
