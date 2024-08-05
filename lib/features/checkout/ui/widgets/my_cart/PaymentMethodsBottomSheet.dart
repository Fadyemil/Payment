import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/utils/styles.dart';
import 'package:payment/core/widget/app_text_button.dart.dart';
import 'package:payment/features/checkout/ui/widgets/payment_details/payment_method_list_view.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  bool isPaypal = false;

  updatePaymentMethod({required int index}) {
    if (index == 0) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16.h),
          PaymentMethodListView(
              // updatePaymentMethod: updatePaymentMethod,
              ),
          SizedBox(height: 32.h),
          AppTextButton(
            buttonText: 'isPaypal',
            textStyle: Styles.styleNormal18,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
