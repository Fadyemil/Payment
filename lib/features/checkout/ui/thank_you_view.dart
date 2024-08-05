import 'package:flutter/material.dart';
import 'package:payment/core/widget/custom_app_bar.dart';
import 'package:payment/features/checkout/ui/widgets/thank_you/thank_you_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Transform.translate(
        offset: const Offset(0, -16),
        child: const ThankYouBody(),
      ),
    );
  }
}
