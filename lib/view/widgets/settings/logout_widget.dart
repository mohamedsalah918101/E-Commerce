import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class LogoutWidget extends StatelessWidget {
  LogoutWidget({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          Get.defaultDialog(
              title: "Logout From the App",
              titleStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              middleText: 'Are you sure you need to logout?',
              middleTextStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              backgroundColor: Colors.grey,
              radius: 10,
              textCancel: 'No',
              cancelTextColor: Colors.black,
              textConfirm: 'Yes',
              confirmTextColor: Colors.white,
              onCancel: () {
                Get.back();
              },
              onConfirm: () {
                controller.signOutUsingFirebase();
              },
              buttonColor: Get.isDarkMode ? pinkColor : mainColor);
        },
        splashColor:Get.isDarkMode ? pinkColor.withOpacity(0.4) : mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
        customBorder: const StadiumBorder(),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: logoutSettings,
              ),
              child: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            TextUtils(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              text: "Log out".tr,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
