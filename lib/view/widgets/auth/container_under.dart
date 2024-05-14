import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String textType;
  final Function() onPressed;

  const ContainerUnder({
    required this.text,
    required this.onPressed,
    required this.textType,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: Get.isDarkMode ? mainColor : pinkColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextUtils(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                text: text,
                color: Colors.white),
            TextButton(
              onPressed: onPressed,
              child: TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  text: textType,
                  color: Colors.white,

              ),
            )
          ],
        ));
  }
}
