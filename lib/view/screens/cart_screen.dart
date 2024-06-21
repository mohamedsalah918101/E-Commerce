import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/cart/cart_product_card.dart';
import '../widgets/cart/cart_total.dart';
import '../widgets/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          appBar: AppBar(
            title: const Text(
              'Cart Items',
            ),
            elevation: 0,
            backgroundColor: Get.isDarkMode ? darkGreyColor : mainColor,
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: (){
                    controller.clearAllProducts();
                  },
                  icon: const Icon(Icons.backspace),
              )
            ],
          ),
          body: Obx((){
            if(controller.productsMap.isEmpty){
              return const EmptyCart();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 570,
                      child: ListView.separated(
                          itemBuilder: (context, index){
                            return CartProductCard(
                              productModels: controller.productsMap.keys.toList()[index],
                              index: index,
                              quantity: controller.productsMap.values.toList()[index],
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                          itemCount: controller.productsMap.length
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: CartTotal(),
                    )
                  ],
                ),
              );
            }
          }
          ),
        )
    );
  }
}
