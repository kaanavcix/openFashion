import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_category/core/enum/icons_enum.dart';
import 'package:flutter_category/core/extension/color_get_theme.dart';
import 'package:flutter_category/cubit/categories_cubit.dart';
import 'package:flutter_category/cubit/product_cubit.dart';
import 'package:flutter_category/view/product_detail_view.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_category/core/extension/icon_extension.dart';

class DrawerDetail extends StatelessWidget {
  DrawerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, ProductState>(
        builder: (context, state) {
      if (state is ProductCategoriesCompeleted) {
        return DefaultTabController(
          length: state.categories.length,
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: GestureDetector(
                    onTap: () => Get.back(), child: IconNames.close.getIcons()),
                bottom: TabBar(
                    onTap: (int index) {
                      context
                          .read<ProductCubit>()
                          .inCategories(state.categories[index]);
                      print(state.runtimeType);
                    },
                    isScrollable: true,
                    unselectedLabelColor: context.getColorTheme().primary,
                    labelColor: Colors.black,
                    indicatorColor: context.getColorTheme().secondary,
                    tabs: state.categories
                        .map<Widget>((e) => Tab(
                              text: e.toString(),
                            ))
                        .toList()),
              ),
              body: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductCompeleted) {
                    return ListView.builder(
                      itemCount: state.productModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () {
                            Get.to(ProductDetailView(
                                productModel: state.productModel[index]));
                          },
                          title: Text(state.productModel[index].title ?? ""),
                        );
                      },
                    );
                  } else if (state is ProductLoading) {
                    return Center(
                      child: circularprogreess(context),
                    );
                  } else if (state is ProductCategoriesCompeleted) {
                    return Center(child: Text("Product Compeleted"));
                  } else {
                    var message = (state as ProductError);
                    return Center(
                      child: Text("data"),
                    );
                  }
                },
              )),
        );
      } else {
        return circularprogreess(context);
      }
    });
  }

  Center circularprogreess(BuildContext context) {
    return Center(
      child:
          CircularProgressIndicator(color: context.getColorTheme().secondary),
    );
  }
}
