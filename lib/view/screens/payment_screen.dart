import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controller/cart_controller.dart';
import '../../utils/theme.dart';
import '../widgets/payment/delivery_container_widget.dart';
import '../widgets/payment/payment_methods_widget.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Payment',
        ),
        elevation: 0,
        backgroundColor: Get.isDarkMode ? darkGreyColor : mainColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                text: "Shipping to",
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              DeliveryContainerWidget(),
              SizedBox(
                height: 20,
              ),
              TextUtils(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                text: "Payment Methods",
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              PaymentMethodWidget(),
              SizedBox(
                height: 30,
              ),
              Center(
                child: TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  text: "Total : ${controller.total}\$",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Get.isDarkMode ? pinkColor : mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Pay Now",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
              )
              // TotalButton()
            ],
          ),
        ),
      ),
    );
  }
}
