import 'package:e_commerce/logic/controller/payment_controller.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({super.key});

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  int radioContainerIndex = 1;
  bool changeColor = false;
  final TextEditingController phoneController = TextEditingController();
  final controller = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
            address: "Egypt, Assiut Feryal Street",
            name: "Mohamed Salah",
            phone: "1550918101",
            title: "Mo Store",
            value: 1,
            color: changeColor ? Colors.white : Colors.grey.shade300,
            icon: Container(),
            onChanged: (int? value) {
              setState(() {
                radioContainerIndex = value!;
                changeColor = !changeColor;
              });
            }),
        SizedBox(
          height: 10,
        ),
        Obx(() => buildRadioContainer(
            address: controller.address.value,
            name: authController.displayUserName.value,
            phone: '${controller.phoneNumber.value}',
            title: "Delivery",
            value: 2,
            color: changeColor ? Colors.grey.shade300 : Colors.white,
            icon: InkWell(
              onTap: () {
                Get.defaultDialog(
                    title: "Enter Your Phone Number",
                    titleStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    backgroundColor: Colors.white,
                    radius: 10,
                    textCancel: " Cancel ",
                    cancelTextColor: Colors.black,
                    textConfirm: " Save ",
                    confirmTextColor: Colors.black,
                    onCancel: () {
                      Get.toNamed(Routes.paymentScreen);
                    },
                    onConfirm: () {
                      Get.back();
                      controller.phoneNumber.value = phoneController.text;
                    },
                    buttonColor: Get.isDarkMode ? pinkColor : mainColor,
                    content: Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        controller: phoneController,
                        cursorColor: Colors.black,
                        maxLength: 11,
                        keyboardType: TextInputType.phone,
                        onSubmitted: (value) {
                          phoneController.text = value;
                        },
                        decoration: InputDecoration(
                            fillColor: Get.isDarkMode
                                ? pinkColor.withOpacity(0.1)
                                : mainColor.withOpacity(0.2),
                            focusColor: Colors.red,
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Get.isDarkMode ? pinkColor : mainColor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                phoneController.clear();
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                            ),
                            hintText: 'Enter Your Phone Number',
                            hintStyle: TextStyle(
                                color: Colors.black45,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            )),
                        style: TextStyle(color: Colors.black),
                      ),
                    ));
              },
              child: Icon(
                Icons.contact_phone,
                size: 20,
                color: Get.isDarkMode ? pinkColor : mainColor,
              ),
            ),
            onChanged: (int? value) {
              setState(() {
                radioContainerIndex = value!;
                changeColor = !changeColor;
              });
              controller.updatePosition();
            }))
      ],
    );
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
    required Widget icon,
  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContainerIndex,
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
            onChanged: (int? value) {
              onChanged(value);
            },
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  text: title,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  text: name,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text("🇪🇬 +20"),
                    TextUtils(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      text: phone,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    SizedBox(
                      child: icon,
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  text: address,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
