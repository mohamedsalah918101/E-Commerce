import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          SizedBox(
            height: 40,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Your Cart is ',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'Empty',
                style: TextStyle(
                    color: Get.isDarkMode ? pinkColor : mainColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ])),
          SizedBox(
            height: 10,
          ),
          Text(
            'Add items to get Started',
            style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 50,),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                onPressed: (){
                  Get.toNamed(Routes.mainScreen);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  backgroundColor: Get.isDarkMode ? pinkColor : mainColor
                ),
                child: Text(
                  'Go to Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}
