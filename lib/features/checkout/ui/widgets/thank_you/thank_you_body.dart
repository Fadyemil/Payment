import 'package:dotted_dashed_line/dotted_dashed_line.dart';
// import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/features/checkout/ui/widgets/thank_you/custom_check_icon.dart';
import 'package:payment/features/checkout/ui/widgets/thank_you/thank_you_card.dart';

class ThankYouBody extends StatelessWidget {
  const ThankYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            bottom: size.height * 0.2 + 20,
            child: DottedDashedLine(
              dashColor: const Color(0xffB8B8B8),
              height: 5.h,
              width: size.width,
              strokeWidth: 2,
              axis: Axis.horizontal,
            ),
          ),
          Positioned(
            bottom: size.height * 0.2,
            left: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: size.height * 0.2,
            right: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          const Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: CustomCheckIcon(),
          ),
        ],
      ),
    );
  }
}