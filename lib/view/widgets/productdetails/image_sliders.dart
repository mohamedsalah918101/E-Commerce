import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/productdetails/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

class ImageSliders extends StatefulWidget {
  final String imageUrl;

  const ImageSliders({
    super.key,
    required this.imageUrl,
  });

  @override
  State<ImageSliders> createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  CarouselController carouselController = CarouselController();
  final cartController = Get.find<CartController>();
  final List<Color> colorSelected = [
    kColor1,
    kColor2,
    kColor3,
    kColor4,
    kColor5
  ];
  int currentPage = 0;
  int currentColor = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.imageUrl,
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            );
          },
          options: CarouselOptions(
              height: 400,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 2),
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                });
              }),
        ),
        Positioned(
            bottom: 30,
            left: 140,
            child: AnimatedSmoothIndicator(
              activeIndex: currentPage,
              count: 3,
              effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Get.isDarkMode ? pinkColor : mainColor,
                  dotColor: Colors.black),
            )),
        Positioned(
            bottom: 30,
            right: 30,
            child: Container(
              height: 180,
              width: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentColor = index;
                        });
                      },
                      child: ColorPicker(
                          outerBorder: currentColor == index,
                          color: colorSelected[index]),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 3,
                    );
                  },
                  itemCount: colorSelected.length),
            )),
        Container(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? pinkColor.withOpacity(0.8)
                          : mainColor.withOpacity(0.8),
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Obx(() {
                return badges.Badge(
                  position: badges.BadgePosition.topEnd(top: -10, end: -10),
                  badgeAnimation: const badges.BadgeAnimation.slide(
                    disappearanceFadeAnimationDuration:
                        Duration(milliseconds: 300),
                  ),
                  badgeContent: Text(
                    cartController.quantity().toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.cartScreen);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? pinkColor.withOpacity(0.8)
                              : mainColor.withOpacity(0.8),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        )
      ],
    );
  }
}
