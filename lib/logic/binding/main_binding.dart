import 'package:e_commerce/logic/controller/main_controller.dart';
import 'package:e_commerce/logic/controller/payment_controller.dart';
import 'package:e_commerce/logic/controller/settings_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
    Get.put(PaymentController(), permanent: true);
  }

}