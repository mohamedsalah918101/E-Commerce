import 'package:e_commerce/model/ProductModels.dart';
import 'package:http/http.dart' as http;

class ProductServices{
  static Future<List<ProductModels>> getProduct() async {
    var response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if(response.statusCode == 200){
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    }else {
      return throw Exception('Failed to load product');
    }
  }
}