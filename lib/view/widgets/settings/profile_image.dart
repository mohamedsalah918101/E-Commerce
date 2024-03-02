import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/logic/controller/settings_controller.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({super.key});

  final controller = Get.find<SettingController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/cv.jpg'
                      ),
                      fit: BoxFit.contain,
                    )),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    text: controller.capitalize(authController.displayUserName.value),
                    color:Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  TextUtils(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    text: authController.displayUserEmail.value,
                    color:Get.isDarkMode ? Colors.white : Colors.black,
                  ),

                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
