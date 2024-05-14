import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/auth/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../utils/my_string.dart';
import '../../widgets/auth/auth_text_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final controller = Get.find<AuthController>();
  ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: context.theme.colorScheme.onSurface,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Get.isDarkMode ? darkGreyColor : Colors.white ,
        title: Text('Forget Password',
        style: TextStyle(color: Get.isDarkMode ? mainColor : pinkColor),
        ),
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Get.isDarkMode ? Colors.black : Colors.white,),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: (){
                      Get.back();
                    },
                    icon: const Icon(Icons.close_rounded,
                    color: Colors.white,),
                  ),
                ),
                const SizedBox(height: 20,),
                Text(
                    "if you want to recover your account, then please provide your email below..",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Get.isDarkMode ? Colors.black : Colors.white),
                ),
                const SizedBox(height: 50,),
                Image.asset('assets/images/forgetpass copy.png',
                width: 250,
                ),
                const SizedBox(height: 30,),
                AuthTextFormField(
                  controller: emailController,
                  obscureText: false,
                  validator: (value) {
                    if(!RegExp(validationEmail).hasMatch(value)){
                      Get.snackbar('Enter Valid E-mail', '');
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: Get.isDarkMode ? Image.asset('assets/images/email.png') : const Icon(Icons.email, color: pinkColor, size: 30,),
                  suffixIcon: const Text(''),
                  hintText: 'Email',
                ),
                const SizedBox(height: 50,),
                GetBuilder<AuthController>(
                    builder: (_){
                      return AuthButton(onPressed: (){
                        if(formKey.currentState!.validate()){
                          controller.resetPasswordUsingFirebase(emailController.text.trim());
                        }
                      }, text: 'SEND');
                    }
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
