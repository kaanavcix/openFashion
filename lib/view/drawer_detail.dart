import 'package:flutter/material.dart';
import 'package:flutter_category/core/enum/icons_enum.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_category/core/extension/icon_extension.dart';

class DrawerDetail extends StatelessWidget {
  const DrawerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () => Get.back(), child: IconNames.close.getIcons()),
      ),
    );
  }
}
