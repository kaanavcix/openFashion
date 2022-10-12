import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_category/core/service/dio_service.dart';
import 'package:flutter_category/core/theme/light_theme.dart';
import 'package:flutter_category/cubit/categories_cubit.dart';
import 'package:flutter_category/cubit/product_cubit.dart';
import 'package:flutter_category/service/networkManager.dart';
import 'package:flutter_category/view/home_view.dart';
import 'package:get/get.dart';

void main() => runApp(MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) =>
            ProductCubit(DioService(NetworkManager.instance.getDio)),
      ),
      BlocProvider(
        create: (context) =>
            CategoriesCubit(DioService(NetworkManager.instance.getDio)),
      )
    ], child: OpenFashion()));

class OpenFashion extends StatelessWidget {
  const OpenFashion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: Get.key,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        title: 'E commerce',
        home: HomeView());
  }
}
