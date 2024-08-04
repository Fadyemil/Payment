import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/utils/styles.dart';

AppBar buildAppBar({final String? title}) {
  return AppBar(
    forceMaterialTransparency: true,
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    title: Text(
      '$title',
      style: Styles.styleMedium25,
    ),
    leading: Center(
      child: SvgPicture.asset(
        'asstes/images/arrow.svg',
        height: 24.h,
      ),
    ),
  );
}
