import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/features/checkout/ui/widgets/payment_details/payment_method_item.dart';

class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({super.key, required this.updatePaymentMethod});
  final Function({required int index}) updatePaymentMethod;

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  final List<String> paymentMethodItems = [
    'asstes/images/card.svg',
    'asstes/images/paypal.svg',
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethodItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: InkWell(
              onTap: () {
                setState(() {
                  activeIndex = index;
                });
                 widget.updatePaymentMethod(index: activeIndex);
              },
              child: PaymentMethodItem(
                isActive: activeIndex == index,
                image: paymentMethodItems[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
