import 'package:flutter/material.dart';
import 'package:flutter_category/core/components/app_bar_widget.dart';
import 'package:flutter_category/core/enum/icons_enum.dart';
import 'package:flutter_category/core/extension/media_query_extension.dart';
import 'package:flutter_category/core/extension/text_theme_extension.dart';
import 'package:flutter_category/core/global/sizedboxGlobal.dart';
import 'package:flutter_category/core/model/product_model.dart';
import 'package:flutter_category/core/extension/icon_extension.dart';
import 'package:flutter_category/core/extension/color_get_theme.dart';
import 'package:flutter_category/core/utility/color_utility.dart';

class ProductDetailView extends StatelessWidget {
  ProductDetailView({required this.productModel, super.key});

  ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarOpenFashion(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.network(
            productModel.image ?? "",
          ),
          const SizedBoxGlobal.normalGlobal(),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    productModel.title ?? "",
                    style: context.getTextTheme().titleSmall,
                  )),
              IconNames.export.getIcons(),
            ],
          ),
          const SizedBoxGlobal.normalGlobal(),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "${productModel.price} TL",
              style: context
                  .getTextTheme()
                  .bodyLarge!
                  .copyWith(color: context.getColorTheme().secondary),
            ),
          ),
          const SizedBoxGlobal.normalGlobal(),
          Container(
            width: context.getWidth(1),
            height: 55,
            color: Colors.black,
            child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconNames.plus.getIcons(
                            colorUtility: context.getColorTheme().surface),
                        Text(
                          "SEPETE EKLE",
                          style: context
                              .getTextTheme()
                              .bodyMedium!
                              .copyWith(color: context.getColorTheme().surface),
                        ),
                      ],
                    ),
                    IconNames.heart.getIcons(
                        colorUtility: context.getColorTheme().secondary)
                  ]),
            ),
          )
        ],
      )),
    );
  }
}
