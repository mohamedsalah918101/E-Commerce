import 'package:e_commerce/model/ProductModels.dart';
import 'package:e_commerce/services/category_services.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  var categoryNameList = <String>[].obs;
  var categoryList = <ProductModels>[].obs;
  var isCategoryLoading = false.obs;
  var isAllCategories = false.obs;

  List<String> imageCategory = [
    'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg',
    'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg',
    'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
    'https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg',
  ];

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  void getCategories() async {
    var categoryName = await CategoryServices.getCategory();

    try{
      isCategoryLoading(true);
      if (categoryName.isNotEmpty){
        categoryNameList.addAll(categoryName);
      }
    } finally{
      isCategoryLoading(false);
    }
  }

  getAllCategories(String nameCategory) async {
    isAllCategories(true);
    categoryList.value = await AllCategoryServices.getAllCategories(nameCategory);

    isAllCategories(false);
  }

  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategories(categoryNameList[index]);
    if(categoryAllName != null){
      categoryList.value = categoryAllName;
    }
  }

}