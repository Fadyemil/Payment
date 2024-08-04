import 'package:flutter/material.dart';
import 'package:payment/core/utils/styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.price});
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Total',
          style: Styles.styleSemiBold24,
        ),
        Spacer(),
        Text(
          '\$${price}',
          style: Styles.styleSemiBold24,
        ),
      ],
    );
  }
}