
import 'package:e_commerce/logic/controller/product_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String description;

  ClothesInfo({super.key, required this.title, required this.productId, required this.rate, required this.description});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,

                  ),
                ),
              ),
              Obx(() => Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? Colors.white.withOpacity(0.9) : Colors.grey.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: (){
                      controller.manageFavorites(productId);
                    },
                    child: controller.isFavorites(productId) ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 20,
                    ) : const Icon(
                      Icons.favorite_outline,
                      color: Colors.black,
                      size: 20,
                    )
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              TextUtils(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  text: "$rate",
                  color: Get.isDarkMode? Colors.white : Colors.black,
              ),
              const SizedBox(
                width: 8,
              ),
              RatingBar.builder(
                initialRating: rate,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 20,
                  ),
                onRatingUpdate: (value) {
                  value = true as double;
                },
                unratedColor: Colors.grey,
              ),

            ],
          ),
          const SizedBox(height: 20,),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: ' Show More',
            trimExpandedText: ' Show Less',
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkColor : mainColor,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkColor : mainColor,
            ),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontSize: 16,
              height: 2,
            ),
          )
        ],
      ),
    );
  }
}
