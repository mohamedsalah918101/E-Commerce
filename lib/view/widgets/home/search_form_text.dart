import 'package:e_commerce/logic/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFormText extends StatelessWidget {
  SearchFormText({super.key});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        builder: (_) => TextField(
              controller: controller.searchTextController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              onChanged: (searchName) {
                controller.addSearchToList(searchName);
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.red,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  suffixIcon: controller.searchTextController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            controller.clearSearch();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        )
                      : null,
                  hintText: 'Search with Name & Price',
                  hintStyle: TextStyle(
                      color: Colors.black45,
                      fontSize: 16,
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
            ));
  }
}
