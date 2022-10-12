import 'dart:io';

import 'package:flutter_category/core/base/base_dio_service.dart';
import 'package:flutter_category/core/model/product_model.dart';

class DioService extends IdioServie {
  DioService(super.dio);

  @override
  Future<List<ProductModel>> fetchItems() async {
    try {
      var response = await dio.get(ProductPath.products.name);

      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        print(response.data.toString());
        if (data is List) {
          return data.map((json) => ProductModel.fromJson(json)).toList();
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return [];
  }

  @override
  Future<List> fetchCategories() async {
    try {
      var response =
          await dio.get("${ProductPath.products.name}/${ProductPath.categories.name}");

      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        
        if (data is List) {
          return data;
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return [];
  }

  @override
  Future<List<ProductModel>> inCategories(String categorie) async {
    try {
      var response =
          await dio.get("${ProductPath.products.name}/${ProductPath.category.name}/$categorie");

      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;

        if (data is List) {
          return data.map((json) => ProductModel.fromJson(json)).toList();
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return [];
  }
}

enum ProductPath { products,categories,category }
