import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const AuthButton({
    required this.onPressed,
    required this.text,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Get.isDarkMode ? mainColor : pinkColor,
          minimumSize: Size(360, 50),
        ),
        onPressed: onPressed,
        child: TextUtils(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            text: text,
            color:  Colors.white));
  }
}
