import 'package:http/http.dart' as http;

import '../models/products_model.dart';
import '../products_bloc.dart';
class ProductsRepo{

  Future<List<ProductsModel>> getProducts() async {
    var response = await http.get(
        Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      return productsModelFromJson(response.body);
    } else {
      throw Exception('Failed to load thie page');
    }
  }
}