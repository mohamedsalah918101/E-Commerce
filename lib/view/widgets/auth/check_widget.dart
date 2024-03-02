import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  final controller = Get.find<AuthController>();

  CheckWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) {
        return Row(
          children: [
            InkWell(
              onTap: () {
                controller.checkBox();
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: controller.isCheckBox
                    ? Get.isDarkMode ? Icon(Icons.done, color: pinkColor,) : Image.asset('assets/images/check.png')
                    : Container(),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              children: [
                TextUtils(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    text: 'I accept ',
                    color: Get.isDarkMode ? Colors.white : Colors.black),
                TextUtils(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  text: 'Terms & Conditions',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underline: TextDecoration.underline,
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
