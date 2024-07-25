

import 'package:bloc_sample_flutter/counter/RepositoryProvider/product_item_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductItemRepository {

  Future<ProductsItem> fetchProductItems() async {
    try {
      final response = await http.get(Uri.parse("https://dummyjson.com/products"));

      if (response.statusCode == 200) {
        var resp = response.body;
        return ProductsItem.fromJson(jsonDecode(resp));
      } else if (response.statusCode == 400) {
        print("response_statusCode: ${jsonDecode(response.body)}");
        return ProductsItem(products: [], total: 0, skip: 0, limit: 0);
      } else {
        throw Exception("Data not found");
      }
    } catch (e) {
      // Handle other types of exceptions, such as network issues
      print("An error occurred: $e");
      throw Exception("Data not found");
    }
  }
}
