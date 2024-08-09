import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/utils/styles.dart';
import 'package:payment/core/widget/app_text_button.dart.dart';
import 'package:payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/features/checkout/ui/manger/payment_stripe/payment_stripe_cubit.dart';
import 'package:payment/features/checkout/ui/thank_you_view.dart';

class CustomButtomBlocConsumer extends StatelessWidget {
  const CustomButtomBlocConsumer({
    super.key,
  });

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
          buttonText: 'isPaypal',
          textStyle: Styles.styleNormal18,
          onPressed: () {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
              cusomerId: 'cus_QcozWeiNHpYXEa', //with the Model Authentication
              amount: '78.65',
              currency: 'Usd',
            );
            context
                .read<PaymentStripeCubit>()
                .makePayement(paymentIntentInputModel: paymentIntentInputModel);
          },
        );
      },
    );
  }
}
