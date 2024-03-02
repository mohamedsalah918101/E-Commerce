import 'package:e_commerce/logic/controller/category_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/home/card_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_items.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key});

  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(controller.isCategoryLoading.value){
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkColor : mainColor,
          ),
        );
      }else {
        return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index){
                return InkWell(
                  onTap: (){
                    controller.getCategoryIndex(index);
                    Get.to(() => CategoryItems(
                      categoryTitle: controller.categoryNameList[index],
                    ));
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Get.isDarkMode ? Colors.black : Colors.black, width: 2),
                      image: DecorationImage(
                          image: NetworkImage(
                              controller.imageCategory[index],
                          ),
                          fit: BoxFit.contain
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 10,),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          controller.categoryNameList[index],
                          style: TextStyle(
                              backgroundColor: Get.isDarkMode ? Colors.white70 : Colors.white70,
                              color: Get.isDarkMode ? Colors.black : mainColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index){
                return SizedBox(height: 20,);
              },
              itemCount: controller.categoryNameList.length,
            ));
      }
    });
  }
}
