import 'package:bloc/bloc.dart';
import 'package:flutter_category/core/base/base_dio_service.dart';
import 'package:flutter_category/cubit/product_cubit.dart';
import 'package:meta/meta.dart';

import '../core/model/product_model.dart';



class CategoriesCubit extends Cubit<ProductState> {
  CategoriesCubit(this.dioService) : super(const ProductInitial());

  IdioServie dioService;
  bool isLoading = false;
  

  void changeLoading() {
    isLoading = !isLoading;
    emit(ProductLoading(isLoading));
  }

  Future<void> getCategories() async {
    try {
      changeLoading();
      List categories = await dioService.fetchCategories();
      changeLoading();
      emit(ProductCategoriesCompeleted(categories));
      
    } catch (message) {
      emit(ProductError(message.toString()));
    }
  }
   
  Future<void> inCategories(String data) async {
    try {
      changeLoading();
      List<ProductModel> model = await dioService.inCategories(data);
      changeLoading();
      emit(ProductCompeleted(model));
      
    } catch (message) {
      emit(ProductError(message.toString()));
    }
  }
}
