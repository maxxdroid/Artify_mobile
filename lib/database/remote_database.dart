import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nerds_project/models/product.dart';

class DatabaseMethods {
  Future<List<Product>> fetchProducts() async {
    const apiUrl = 'https://fox-current-filly.ngrok-free.app/api/products/';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parsing the JSON
      final List<dynamic> jsonList = json.decode(response.body);

      List<Product> products =
          jsonList.map((json) => Product.fromJson(json)).toList();

      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Product>> searchProducts(
      List<Product> products, String query) async {
    return products
        .where((product) =>
            product.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
