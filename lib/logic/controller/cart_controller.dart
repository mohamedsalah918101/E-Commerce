import 'package:e_commerce/model/ProductModels.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductToCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += 1;
    } else {
      productsMap[productModels] = 1;
    }

    Get.snackbar('Added to Cart',
      '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.isDarkMode ? pinkColor : mainColor,
      colorText: Colors.white,
    );
  }

  void removeProductsFromCart(ProductModels productModels) {
    if(productsMap.containsKey(productModels) && productsMap[productModels] == 1){
      productsMap.removeWhere((key, value) => key == productModels);
    }else{
      productsMap[productModels] -= 1;
    }

  }

  void removeOneProduct(ProductModels productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProducts() {
    Get.defaultDialog(
        title: "Empty Cart",
        titleStyle: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
        middleText: 'Are you sure you want to remove all products?',
        middleTextStyle: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
        backgroundColor: Colors.grey,
        radius: 10,
        textCancel: 'No',
        cancelTextColor: Colors.black,
        textConfirm: 'Yes',
        confirmTextColor: Colors.white,
        onCancel: (){
          Get.toNamed(Routes.cartScreen);
        },
        onConfirm: (){
          productsMap.clear();
          Get.back();
        },
        buttonColor: Get.isDarkMode ? pinkColor : mainColor
    );

  }

  get productSubTotal => productsMap.entries.map((e) => e.key.price * e.value).toList();
  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity(){
    if(productsMap.isEmpty){
      return 0;
    }else{
      return productsMap.entries.map((e) => e.value).toList().reduce((value, element) => value + element);

    }
  }
}
