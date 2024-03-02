
import 'package:http/http.dart' as http;

import '../model/ProductModels.dart';
import '../model/category_model.dart';

class CategoryServices{
  static Future<List<String>> getCategory() async {
    var response = await http.get(Uri.parse('https://fakestoreapi.com/products/categories'));
    if(response.statusCode == 200){
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    }else {
      return throw Exception('Failed to load product');
    }
  }
}

class AllCategoryServices{
  static Future<List<ProductModels>> getAllCategories(String categoryNames) async {
    var response = await http.get(Uri.parse('https://fakestoreapi.com/products/category/$categoryNames'));
    if(response.statusCode == 200){
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    }else {
      return throw Exception('Failed to load product');
    }
  }
}