
import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/logic/controller/main_controller.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

import 'category_screen.dart';
import 'favorites_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          leading: Container(),
          elevation: 0,
          actions: [
            Obx((){
              return badges.Badge(
                  position: badges.BadgePosition.topEnd(top: 0, end: 3),
                  badgeAnimation: badges.BadgeAnimation.slide(
                    disappearanceFadeAnimationDuration:
                    Duration(milliseconds: 300),
                  ),
                  badgeContent: Text(
                    cartController.quantity().toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.cartScreen);
                      },
                      icon: Image.asset('assets/images/shop.png')));
            })
          ],
          title: Text(controller.title[controller.currentIndex.value]),
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? darkGreyColor : mainColor,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Get.isDarkMode ? darkGreyColor : Colors.white,
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Get.isDarkMode ? pinkColor : mainColor,
              ),
              icon: Icon(
                Icons.home,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.category,
                color: Get.isDarkMode ? pinkColor : mainColor,
              ),
              icon: Icon(
                Icons.category,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.favorite,
                color: Get.isDarkMode ? pinkColor : mainColor,
              ),
              icon: Icon(
                Icons.favorite,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.settings,
                color: Get.isDarkMode ? pinkColor : mainColor,
              ),
              icon: Icon(
                Icons.settings,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: '',
            ),
          ],
          onTap: (index) {
            controller.currentIndex.value = index;
          },
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: [
            HomeScreen(),
            CategoryScreen(),
            FavoritesScreen(),
            SettingsScreen()
          ],
        ),
      );
    }));
  }
}
