import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_category/core/base/base_dio_service.dart';
import 'package:flutter_category/core/components/product_card_horizontal.dart';
import 'package:flutter_category/core/enum/icons_enum.dart';
import 'package:flutter_category/core/extension/icon_extension.dart';
import 'package:flutter_category/core/model/product_model.dart';
import 'package:flutter_category/core/service/dio_service.dart';
import 'package:flutter_category/core/utility/color_utility.dart';
import 'package:flutter_category/cubit/product_cubit.dart';
import 'package:flutter_category/view/drawer_detail.dart';
import 'package:get/route_manager.dart';


class ProductView extends StatelessWidget {
  const ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProductCubit(DioService(Dio())),
        child: ProductViewCubit());
  }
}

class ProductViewCubit extends StatefulWidget {
  const ProductViewCubit({super.key});

  @override
  State<ProductViewCubit> createState() => _ProductViewCubitState();
}

class _ProductViewCubitState extends State<ProductViewCubit> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductCubit>().fetchProcutItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCCCCCC),
        appBar: AppBar(
          title: Text("data"),
          leading: GestureDetector(onTap:(){
            Get.to(DrawerDetail(),curve: Curves.easeInQuint);
          } ,child: IconNames.menu.getIcons()),
        ),
        body: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is ProductInitial) {
              return Center(
                child: Text("data"),
              );
            } else if (state is ProductLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductCompeleted) {
              return ListView.builder(
                shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    var data = state.productModel[index];
                    return ProductCardHorizontal(data: data);
                  },
                  itemCount: state.productModel.length);
            } else {
              var message = (state as ProductError);
              return Center(
                child: Text(message.toString()),
              );
            }
          },
        ));
  }
}



