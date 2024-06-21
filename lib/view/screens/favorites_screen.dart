import 'package:e_commerce/logic/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Obx((){
        if(controller.favoritesList.isEmpty){
          return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/images/heart.png'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Please, Add your Favorites Products.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Get.isDarkMode ? Colors.white : Colors.black
                      ),
                    )
                  ],
                ),
              );
        } else {
          return ListView.separated(
              itemBuilder: (context, index){
                return buildFavoriteItems(
                  image: controller.favoritesList[index].image,
                  price: controller.favoritesList[index].price,
                  title: controller.favoritesList[index].title,
                  productId: controller.favoritesList[index].id
                );
              },
              separatorBuilder: (context, index){
                return const Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
              itemCount: controller.favoritesList.length
          );
        }
      }),
    );
  }

  Widget buildFavoriteItems({
    required String image,
    required double price,
    required String title,
    required int productId,
}) {
    return Padding(
        padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.contain,

                  ),
                ),
              ),
            ),
            const SizedBox(width: 15,),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      title,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    '\$ $price',
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: (){
                  controller.manageFavorites(productId);
                },
                icon: const Icon(Icons.favorite, color: Colors.red, size: 30,)
            ),
          ],
        ),
      ),
    );
  }


}