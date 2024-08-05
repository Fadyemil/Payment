import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/utils/styles.dart';
import 'package:payment/core/widget/app_text_button.dart.dart';
import 'package:payment/features/checkout/ui/payment_details.dart';
import 'package:payment/features/checkout/ui/widgets/my_cart/OrderInfoItem.dart';
import 'package:payment/features/checkout/ui/widgets/my_cart/total_price.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 18.h,
          ),
          Container(
            height: size.height * 0.75.h,
            child: Image.asset(
              'asstes/images/basket_image.png',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 12.h),
          const OrderInfoItem(title: 'Order Subtotal', value: '42.97'),
          SizedBox(height: 3.h),
          const OrderInfoItem(title: 'Discount', value: '0'),
          SizedBox(height: 3.h),
          const OrderInfoItem(title: 'Shipping', value: '8'),
          SizedBox(height: 3.h),
          Divider(
            thickness: 2.w,
            height: 34.h,
            color: const Color(0xffC7C7C7),
          ),
          const TotalPrice(price: '50.97'),
          SizedBox(height: 20.h),
          AppTextButton(
            buttonText: 'Complete Payment',
            textStyle: Styles.styleMedium22,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return PaymentDetails();
                  },
                ),
              );
            },
          ),
          SizedBox(height: 12.h)
        ],
      ),
    );
  }
}
