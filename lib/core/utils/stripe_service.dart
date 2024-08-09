import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/core/utils/api_service.dart';
import 'package:payment/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment/features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      body: paymentIntentInputModel.toJson(),
      token: ApiKeys.secretKey,
      contentType: Headers.formUrlEncodedContentType,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    //~ Initialize the payment sheet using Stripe's parameters
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // * Payment Intent Client Secret used to identify the specific payment transaction
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,

        //* The merchant's display name that will appear on the payment sheet
        merchantDisplayName: 'fady emil',

        //* Ephemeral key secret for the customer session
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,

        //* Customer ID to identify the associated customer
        customerId: initPaymentSheetInputModel.customerId,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      body: {
        'customer': customerId,
      },
      headers: {
        'Authorization': "Bearer ${ApiKeys.secretKey}",
        'Stripe-Version': '2024-06-20',
      },
      token: ApiKeys.secretKey,
      contentType: Headers.formUrlEncodedContentType,
    );
    var ephermeralKey = EphemeralKeyModel.fromJson(response.data);
    return ephermeralKey;
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    // Step 1: Create a payment intent using the provided input model
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);

    // Step 2: Create an ephemeral key associated with the customer ID
    var ephemerKeyModel =
        await createEphemeralKey(customerId: paymentIntentInputModel.cusomerId);

    // Step 3: Prepare the input model for initializing the payment sheet
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      clientSecret: paymentIntentModel
          .clientSecret!, // The client secret from the payment intent
      customerId: paymentIntentInputModel.cusomerId, // The customer ID
      ephemeralKeySecret: ephemerKeyModel.secret!, // The ephemeral key secret
    );

    // Step 4: Initialize the payment sheet with the prepared input model
    await initPaymentSheet(
      initPaymentSheetInputModel: initPaymentSheetInputModel,
    );

    // Step 5: Display the payment sheet to the user
    await displayPaymentSheet();
  }
}
