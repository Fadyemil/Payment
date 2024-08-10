import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment/core/function/get_transctions.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/core/utils/styles.dart';
import 'package:payment/core/widget/app_text_button.dart.dart';
import 'package:payment/features/checkout/data/models/amount_model/amount_model.dart';
// import 'package:payment/features/checkout/data/models/amount_model/details.dart';
// import 'package:payment/features/checkout/data/models/item_list_model/item.dart';
import 'package:payment/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:payment/features/checkout/data/models/payment_intent_input_model.dart';
// import 'package:payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/features/checkout/ui/manger/payment_stripe/payment_stripe_cubit.dart';
import 'package:payment/features/checkout/ui/my_cart_view.dart';
import 'package:payment/features/checkout/ui/thank_you_view.dart';

class CustomButtomBlocConsumer extends StatelessWidget {
  const CustomButtomBlocConsumer({
    super.key,
    required this.isPaypal,
  });
  final bool isPaypal;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentStripeCubit, PaymentStripeState>(
      listener: (context, state) {
        if (state is PaymentStripeSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return const ThankYouView();
              },
            ),
          );
        }
        if (state is PaymentStripeFailure) {
          Navigator.pop(context);
          SnackBar snackBar = SnackBar(
            content: Text(state.errorMessage),
            duration: Duration(milliseconds: 3000),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return AppTextButton(
          isLoading: state is PaymentStripeLoading ? true : false,
          buttonText: isPaypal ? 'isPaypal' : ' Strip ',
          textStyle: Styles.styleNormal18,
          onPressed: () {
            if (isPaypal) {
              var transactionData = getTransctionsData();
              exceutePaypalPayment(context, transactionData);
            } else {
              excuteStripePayment(context);
            }
          },
        );
      },
    );
  }

  void excuteStripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      cusomerId: 'cus_QcozWeiNHpYXEa', //with the Model Authentication
      amount: '78.65',
      currency: 'Usd',
    );
    context
        .read<PaymentStripeCubit>()
        .makePayement(paymentIntentInputModel: paymentIntentInputModel);
  }

  void exceutePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transctionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.paypayClientId,
        secretKey: ApiKeys.payPalSecretKey,
        transactions: [
          {
            "amount": transctionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transctionsData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return const ThankYouView();
            }),
            (route) {
              if (route.settings.name == '/') {
                return true;
              } else {
                return false;
              }
            },
          );
        },
        onError: (error) {
          SnackBar snackBar = SnackBar(content: Text(error.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return const MyCartView();
            }),
            (route) {
              return false;
            },
          );
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }
}
