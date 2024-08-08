import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/features/checkout/data/repos/checkout_repo.dart';

part 'payment_stripe_state.dart';

class PaymentStripeCubit extends Cubit<PaymentStripeState> {
  PaymentStripeCubit(this.checkoutRepo) : super(PaymentStripeInitial());
  final CheckoutRepo checkoutRepo;

  Future makePayement(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentStripeLoading());
    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold(
      (left) {
        emit(
          PaymentStripeFailure(left.errMessage),
        );
      },
      (right) {
        emit(PaymentStripeSuccess());
      },
    );
  }

  @override
  void onChange(Change<PaymentStripeState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
