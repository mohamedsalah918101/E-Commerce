
import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/my_string.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/check_widget.dart';
import '../../widgets/auth/container_under.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.colorScheme.onSurface,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyColor : Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 40,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextUtils(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            text: "SIGN",
                            color: Get.isDarkMode ? mainColor : pinkColor,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          TextUtils(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            text: "UP",
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      AuthTextFormField(
                        controller: nameController,
                        obscureText: false,
                        validator: (value) {
                          if(value.toString().length <= 2 || !RegExp(validationName).hasMatch(value)){
                            Get.snackbar('Enter Valid Name', 'more than 2 letters and does not have a numbers',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green,
                              colorText: Colors.white,
                            );
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode ? Image.asset('assets/images/user.png'): const Icon(Icons.person, color: pinkColor, size: 30,),
                        suffixIcon: const Text(''),
                        hintText: 'User Name',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthTextFormField(
                        controller: emailController,
                        obscureText: false,
                        validator: (value) {
                          if(!RegExp(validationEmail).hasMatch(value)){
                            Get.snackbar('Enter Valid E-mail', '',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green,
                              colorText: Colors.white,
                            );
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode ? Image.asset('assets/images/email.png') : const Icon(Icons.email, color: pinkColor, size: 30,),
                        suffixIcon: const Text(''),
                        hintText: 'Email',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return AuthTextFormField(
                            controller: passwordController,
                            obscureText: controller.isVisibility ? false : true,
                            validator: (value) {
                              if(value.toString().length < 6){
                                Get.snackbar('Password should be longer or equal 6 characters', '',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white,
                                );
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode ? Image.asset('assets/images/lock.png') : const Icon(Icons.lock, color: pinkColor, size: 30,),
                            suffixIcon: IconButton(
                              onPressed: (){
                                controller.visibility();
                              },
                              icon: controller.isVisibility ? const Icon(Icons.visibility_off, color: Colors.black,) : const Icon(Icons.visibility, color: Colors.black,),
                            ),
                            hintText: 'Password',
                          );
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CheckWidget(),
                      const SizedBox(
                        height: 50,
                      ),
                      GetBuilder<AuthController>(
                          builder: (_){
                            return AuthButton(onPressed: ()  {
                              if(controller.isCheckBox == false){
                                Get.snackbar('Please Accept terms and conditions', '',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white,
                                );
                              } else if(formKey.currentState!.validate()){
                                controller.signUpUsingFirebase(
                                    nameController.text.trim(),
                                    emailController.text.trim(),
                                    passwordController.text);

                                controller.isCheckBox == true;
                              }
                            }, text: 'SIGN UP');
                          }
                      )
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              text: 'Already have an Account? ',
              onPressed: () {
                Get.toNamed(Routes.loginScreen);
              },
              textType: 'Login',
            )
          ],
        ),
      ),
    ));
  }
}
