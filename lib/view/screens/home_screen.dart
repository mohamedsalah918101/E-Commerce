import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:get/get.dart';

import '../widgets/home/card_items.dart';
import '../widgets/home/search_form_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.colorScheme.onSurface,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
                color: Get.isDarkMode ? Colors.black : mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      text: 'Find Your',
                      color: Colors.white),
                  const SizedBox(
                    height: 5,
                  ),
                  TextUtils(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      text: 'INSPIRATION',
                      color:Get.isDarkMode ? pinkColor : Colors.white),
                  const SizedBox(
                    height: 20,
                  ),
                  SearchFormText(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  text: 'Categories',
                  color:Get.isDarkMode ? Colors.white : Colors.black),
            ),
          ),
          const SizedBox(height: 20,),
          CardItems()
        ],
      ),
    ));
  }
}
