import 'dart:convert';

import 'package:dio/dio.dart';

import '../pages/model/model.dart';

class ApiServices {
  final Dio dio = Dio();

  Future<List<ProductModel>?> getapi() async {
    try {
      Response response = await dio.get(
          'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');

      if (response.statusCode == 200) {
        // log(response.statusCode.toString());
        final jsonresponse = json.encode(response.data);
        return productModelFromJson(jsonresponse);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
