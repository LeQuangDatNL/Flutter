import 'package:app/model/Products.dart';
import 'package:dio/dio.dart';

class ApiProduct {
  final Dio dio = Dio();

  Future<List<Products>> getAllProduct() async {
    var response = await dio.get('https://fakestoreapi.com/products');

    if (response.statusCode == 200) {
      List data = response.data;
      return data.map((e) => Products.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
