import 'package:e_commerce/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/container_under.dart';
import '../../widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,

          appBar: AppBar(
            backgroundColor: Get.isDarkMode ? darkGreyColor : Colors.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Padding(
                    padding: EdgeInsets.only(
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
                                text: "LOG",
                                color: Get.isDarkMode ? mainColor : pinkColor,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              TextUtils(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                text: "IN",
                                color: Get.isDarkMode ? Colors.white : Colors.black,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
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
                            prefixIcon: Get.isDarkMode ? Image.asset('assets/images/email.png') : Icon(Icons.email, color: pinkColor, size: 30,),
                            suffixIcon: Text(''),
                            hintText: 'Email',
                          ),
                          SizedBox(
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
                                prefixIcon: Get.isDarkMode ? Image.asset('assets/images/lock.png') : Icon(Icons.lock, color: pinkColor, size: 30,),
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    controller.visibility();
                                  },
                                  icon: controller.isVisibility ? Icon(Icons.visibility_off, color: Colors.black,) : Icon(Icons.visibility, color: Colors.black,),
                                ),
                                hintText: 'Password',
                              );
                            },
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: (){
                                Get.toNamed(Routes.forgetPasswordScreen);
                              },
                              child: TextUtils(fontSize: 14, fontWeight: FontWeight.normal, text: 'Forget Password?',
                                  color: Get.isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 50,),
                          GetBuilder<AuthController>(
                              builder: (_){
                                return AuthButton(onPressed: () {
                                  if(formKey.currentState!.validate()){
                                    controller.logInUsingFirebase(
                                        emailController.text.trim(),
                                        passwordController.text);
                                  }
                                }, text: 'LOG IN');
                              }
                          ),
                          SizedBox(height: 20,),
                          Center(
                            child: TextUtils(fontSize: 18, fontWeight: FontWeight.w500, text: 'OR', color: Get.isDarkMode ? Colors.black : Colors.white),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GetBuilder<AuthController>(
                                  builder: (_){
                                    return InkWell(
                                      onTap: (){
                                        controller.googleSignUpUsingFirebase();
                                      },
                                      child: Image.asset('assets/images/google.png'),
                                    );
                                  }
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ContainerUnder(
                  text: 'Do not have an Account? ',
                  onPressed: () {
                    Get.toNamed(Routes.signUpScreen);
                  },
                  textType: 'Sign Up',
                )
              ],
            ),
          ),
        ));
  }
}
