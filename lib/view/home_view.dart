import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:flutter_category/core/enum/icons_enum.dart';
import 'package:flutter_category/core/extension/icon_extension.dart';
import 'package:flutter_category/core/extension/media_query_extension.dart';
import 'package:flutter_category/core/extension/text_theme_extension.dart';
import 'package:flutter_category/core/utility/color_utility.dart';
import 'package:flutter_category/cubit/categories_cubit.dart';
import 'package:flutter_category/cubit/product_cubit.dart';
import 'package:flutter_category/view/drawer_detail.dart';
import 'package:get/route_manager.dart ';

import '../core/components/app_bar_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CategoriesCubit>().getCategories();
    context.read<ProductCubit>().inCategories("jewelery");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarOpenFashion(),
        body: SingleChildScrollView(
          child: Column(children: [
            Image.asset(
              "assets/images/homeimage.png",
             //              "assets/images/emo.jpeg"

              fit: BoxFit.cover,
              width: context.getWidth(1),
            ),
            emptyHeight(),
            Text(
              "New Arrival",
              style: context.getTextTheme().titleLarge,
            ),
            emptyHeight(),
            BlocConsumer<CategoriesCubit, ProductState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is ProductInitial) {
                  return const Center(
                    child: Text("data"),
                  );
                }

                if (state is ProductCategoriesCompeleted) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 55,
                        width: context.getWidth(1),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            return OutlinedButton(
                                onPressed: () {
                                  context.read<ProductCubit>().inCategories(
                                      state.categories[index].toString());
                                },
                                child:
                                    Text(state.categories[index].toString()));
                          },
                        ),
                      ),
                      BlocConsumer<ProductCubit, ProductState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          if (state is ProductCompeleted) {
                            return SizedBox(
                              height: context.getHeight(1),
                              width: context.getWidth(1),
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 2,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.network(
                                        state.productModel[index].image ?? "",
                                        width: context.getWidth(0.5),
                                        height: 100,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          state.productModel[index].title ?? "",
                                          style:
                                              context.getTextTheme().bodySmall,
                                        ),
                                      ),
                                      Text(state.productModel[index].price
                                          .toString()),
                                    ],
                                  );
                                },
                              ),
                            );
                          } else if (state is ProductLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                  backgroundColor: ColorUtility.primaryColor),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                  backgroundColor: Colors.black),
                            );
                          }
                        },
                      )
                    ],
                  );
                } else if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorUtility.secondaryColor,
                    ),
                  );
                } else {
                  var message = state.runtimeType!=ProductCompeleted? (state as ProductError) : "";
                  return Center(
                    child: Text(message.toString()),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [Text("BLOG"), Text("BLOG"), Text("BLOG")],
              ),
            )
          ]),
        ));
  }

  SizedBox emptyHeight() {
    return const SizedBox(
      height: 10,
    );
  }
}

