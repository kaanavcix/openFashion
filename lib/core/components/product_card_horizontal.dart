import 'package:flutter/material.dart';
import 'package:flutter_category/core/enum/icons_enum.dart';
import 'package:flutter_category/core/extension/icon_extension.dart';
import 'package:flutter_category/core/utility/color_utility.dart';

import '../model/product_model.dart';

class ProductCardHorizontal extends StatelessWidget {
  ProductCardHorizontal({required this.data, super.key});
  ProductModel data;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Image.network(
                  data.image ?? "",
                ),
              ),
              Expanded(
                flex: 8,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title ?? "",
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 2,
                    ),
                    Text(
                      data.description ?? "",
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 2,
                    ),
                    Text(
                      data.price.toString() + "TL",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: ColorUtility.primaryColor),
                      maxLines: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: ColorUtility.secondaryColor,
                            ),
                            Text(
                              data.rating?.rate.toString() ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: ColorUtility.primaryColor),
                              maxLines: 2,
                            ),
                          ],
                        ),
                        IconNames.heart
                            .getIcons(colorUtility: ColorUtility.secondaryColor)
                      ],
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
