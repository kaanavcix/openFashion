import 'package:flutter/material.dart';
import 'package:flutter_category/core/extension/icon_extension.dart';
import 'package:get/route_manager.dart';

import '../../view/drawer_detail.dart';
import '../enum/icons_enum.dart';

class AppBarOpenFashion extends StatelessWidget with PreferredSizeWidget {
   AppBarOpenFashion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Get.to(() =>  DrawerDetail(),
            curve: Curves.easeInBack,
            transition: Transition.leftToRight,
            duration: const Duration(seconds: 1)),
        child: Padding(
            padding: EdgeInsets.all(4), child: IconNames.menu.getIcons()),
      ),
      title: IconNames.logo.getIcons(padding: EdgeInsets.zero),
      actions: [
        IconNames.search.getIcons(),
        IconNames.shoppingbag.getIcons()
      ],
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
