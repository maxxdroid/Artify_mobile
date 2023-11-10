import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nerds_project/models/product.dart';

class DatabaseMethods {
  Future<List<Product>> fetchProducts() async {
    const apiUrl =
        'https://fox-current-filly.ngrok-free.app/api/products/'; // Replace with your API endpoint

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final List<dynamic> jsonList = json.decode(response.body);

      List<Product> products =
          jsonList.map((json) => Product.fromJson(json)).toList();

      return products;
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load products');
    }
  }
}
