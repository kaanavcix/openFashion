import 'package:flutter/cupertino.dart';
import 'package:flutter_category/core/utility/color_utility.dart';

import '../enum/icons_enum.dart';
import 'package:flutter_svg/svg.dart';

extension SvgIconsNames on IconNames {


  Widget getIcons({Color colorUtility =ColorUtility.textColor, EdgeInsetsGeometry padding  = const EdgeInsets.all(10) }) {
   return Padding(
    padding: padding,
     child: SvgPicture.asset(
        "assets/icons/$name.svg",
        height: 24,
        width: 24,
        
        color: colorUtility
      ),
   );
  }
}
