import 'package:dio/dio.dart';
import 'package:flutter_category/core/model/product_model.dart';

abstract class IdioServie {
  final Dio dio;

  IdioServie(this.dio);

  Future<List<ProductModel>> fetchItems();
  Future<List> fetchCategories();
  Future<List<ProductModel>> inCategories(String categorie);
}



