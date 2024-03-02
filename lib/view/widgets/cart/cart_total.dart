import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  CartTotal({super.key});

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(left: 5),
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    text: 'Total',
                    color: Colors.grey
                ),
                Text(
                  '\$ ${controller.total}',
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
                )
              ],
            ),
            SizedBox(width: 20,),
            Expanded(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                    onPressed: (){
                      Get.toNamed(Routes.paymentScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                      backgroundColor: Get.isDarkMode ? pinkColor : mainColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Check Out',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                          ),
                        ),
                        SizedBox(width: 10,),
                        Icon(Icons.shopping_cart, color: Colors.white,),
                      ],
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
