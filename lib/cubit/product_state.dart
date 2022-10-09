part of 'product_cubit.dart';

@immutable
abstract class ProductState {
  const ProductState();
}

class ProductInitial extends ProductState {
  const ProductInitial();
}

class ProductLoading extends ProductState {
  final bool isLoading;

  const ProductLoading(this.isLoading);
}

class ProductCompeleted extends ProductState {
  final List<ProductModel> productModel;

  const ProductCompeleted(this.productModel);
}

class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);
}

class ProductCategoriesCompeleted extends ProductState {
  final List categories;
  const ProductCategoriesCompeleted(this.categories);
}
