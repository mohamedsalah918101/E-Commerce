import 'package:e_commerce/logic/binding/main_binding.dart';
import 'package:e_commerce/logic/binding/product_binding.dart';
import 'package:e_commerce/view/screens/auth/forget_password_screen.dart';
import 'package:e_commerce/view/screens/auth/login_screen.dart';
import 'package:e_commerce/view/screens/auth/signup_screen.dart';
import 'package:e_commerce/view/screens/cart_screen.dart';
import 'package:e_commerce/view/screens/payment_screen.dart';
import 'package:get/get.dart';

import '../logic/binding/auth_binding.dart';
import '../view/screens/main_screen.dart';
import '../view/screens/welcome_screen.dart';
class AppRoutes{
  // initial Route
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;
  // getPages
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding()
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgetPasswordScreen,
      page: () => ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ]
    ),
    GetPage(
        name: Routes.paymentScreen,
        page: () => PaymentScreen(),
        bindings: [
          AuthBinding(),
          ProductBinding(),
          MainBinding(),
        ]
    ),
  ];
}
class Routes{
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
  static const paymentScreen = '/paymentScreen';
}