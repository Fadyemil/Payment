import 'package:flutter/material.dart';
import 'package:payment/core/widget/custom_app_bar.dart';
import 'package:payment/features/checkout/ui/widgets/my_cart/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "My Cart"),
      body: SingleChildScrollView(
        child: MyCartViewBody(),
      ),
    );
  }
}
