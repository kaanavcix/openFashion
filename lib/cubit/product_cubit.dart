import 'package:bloc/bloc.dart';
import 'package:flutter_category/core/base/base_dio_service.dart';
import 'package:flutter_category/core/model/product_model.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.dioService) : super(const ProductInitial());

  IdioServie dioService;
  bool isLoading = false;
  Future<void> fetchProcutItems() async {
    try {
      changeLoading();
      List<ProductModel> data = await dioService.fetchItems();
      changeLoading();

      if (data is List) {
        emit(ProductCompeleted(data));
      }
    } catch (message) {
      ProductError(message.toString());
    }
  }

  void changeLoading() {
    isLoading = !isLoading;
    emit(ProductLoading(isLoading));
  }

  Future<void> inCategories(String data) async {
    try {
      changeLoading();
      List<ProductModel> model = await dioService.inCategories(data);
      print(model);
      changeLoading();
      emit(ProductCompeleted(model));
    } catch (message) {
      emit(ProductError(message.toString()));
    }
  }
}
