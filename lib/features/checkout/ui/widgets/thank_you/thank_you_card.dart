import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment/core/utils/styles.dart';
import 'package:payment/features/checkout/ui/widgets/my_cart/total_price.dart';
import 'package:payment/features/checkout/ui/widgets/thank_you/card_info_widget.dart';
import 'package:payment/features/checkout/ui/widgets/thank_you/payment_item_info.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xffEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 50 + 16,
          left: 22,
          right: 22,
        ),
        child: Column(
          children: [
            Text(
              'Thank you',
              textAlign: TextAlign.center,
              style: Styles.styleMedium25,
            ),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: Styles.styleNormal20,
            ),
            SizedBox(height: 42.h),
            const PaymentItemInfo(
              title: 'Date',
              value: '01/24/2023',
            ),
            SizedBox(height: 20.h),
            const PaymentItemInfo(
              title: 'Time',
              value: '10:15 AM',
            ),
            SizedBox(height: 20.h),
            const PaymentItemInfo(
              title: 'To',
              value: 'Sam Louis',
            ),
            SizedBox(height: 20.h),
            Divider(
              height: 40.h,
              thickness: 2,
            ),
            TotalPrice(price: '50.97'),
            SizedBox(height: 30.h),
            cardInfoWidget(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  FontAwesomeIcons.barcode,
                  size: 64.h,
                ),
                Container(
                  width: 113.w,
                  height: 58.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.50.w, color: const Color(0xFF34A853)),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      textAlign: TextAlign.center,
                      style: Styles.styleSemiBold24
                          .copyWith(color: const Color(0xff34A853)),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height:
                  (((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29).h,
            ),
          ],
        ),
      ),
    );
  }
}
