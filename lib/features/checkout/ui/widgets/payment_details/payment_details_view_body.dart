import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/utils/styles.dart';
import 'package:payment/core/widget/app_text_button.dart.dart';
import 'package:payment/features/checkout/ui/thank_you_view.dart';
import 'package:payment/features/checkout/ui/widgets/payment_details/custom_credit_card.dart';
import 'package:payment/features/checkout/ui/widgets/payment_details/payment_method_list_view.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: PaymentMethodListView(),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            formkey: formKey,
            autovalidateMode: autovalidateMode,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 12.h,
                left: 16.w,
                right: 16.w,
              ),
              child: AppTextButton(
                buttonText: 'Pay',
                textStyle: Styles.styleMedium22,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    log('payment');
                  } else {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const ThankYouView();
                    }));
                  }
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
