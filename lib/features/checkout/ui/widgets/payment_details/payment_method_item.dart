import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.isActive,
    required this.image,
  });
  final bool isActive;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 103.w,
      height: 62.h,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
              color: isActive ? const Color(0xFF34A853) : Colors.grey,
              width: 1.50,
            ),
          ),
          shadows: [
            BoxShadow(
              color: isActive ? const Color(0xFF34A853) : Colors.white,
              blurRadius: 4,
              offset: const Offset(0, 0),
              spreadRadius: 0,
            )
          ]),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        child: Center(
          child: SvgPicture.asset(
            image,
            height: 50.h,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
