import 'package:flutter/material.dart';
import 'package:payment/core/widget/custom_app_bar.dart';
import 'package:payment/features/checkout/ui/widgets/payment_details/payment_details_view_body.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Payment Details'),
      body: PaymentDetailsViewBody(),
    );
  }
}
