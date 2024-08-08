part of 'payment_stripe_cubit.dart';

@immutable
sealed class PaymentStripeState {}

final class PaymentStripeInitial extends PaymentStripeState {}

final class PaymentStripeLoading extends PaymentStripeState {}

final class PaymentStripeSuccess extends PaymentStripeState {}

final class PaymentStripeFailure extends PaymentStripeState {
  final String errorMessage;

  PaymentStripeFailure(this.errorMessage);
}
