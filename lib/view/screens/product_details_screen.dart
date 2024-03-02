import 'package:e_commerce/model/ProductModels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/productdetails/add_cart.dart';
import '../widgets/productdetails/clothes_info.dart';
import '../widgets/productdetails/image_sliders.dart';
import '../widgets/productdetails/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;

  ProductDetailsScreen({
  super.key,
  required this.productModels,
});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(
                imageUrl: productModels.image,
              ),
              ClothesInfo(
                title: productModels.title,
                productId: productModels.id,
                rate: productModels.rating.rate,
                description: productModels.description,
              ),
              SizeList(),
              AddCart(
                price: productModels.price,
                productModels: productModels,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
