import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/utils/styles.dart';

class cardInfoWidget extends StatelessWidget {
  const cardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      // height: 75.h,
      // padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset('asstes/images/master_card.svg'),
          const SizedBox(
            width: 23,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Credit Card ',
                style: Styles.styleNormal18,
              ),
              Text(
                'Mastercard **78',
                style: Styles.style16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
