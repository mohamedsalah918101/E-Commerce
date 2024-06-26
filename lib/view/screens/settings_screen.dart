
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/settings/dark_mode_widget.dart';
import '../widgets/settings/language_widget.dart';
import '../widgets/settings/logout_widget.dart';
import '../widgets/settings/profile_image.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileImage(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          TextUtils(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            text: "GENERAL".tr,
            color: Get.isDarkMode ? pinkColor : mainColor,
          ),
          const SizedBox(height: 20,),
          DarkModeWidget(),
          const SizedBox(height: 20,),
          LanguageWidget(),
          const SizedBox(height: 20,),
          LogoutWidget()
        ],
      ),
    );
  }
}
