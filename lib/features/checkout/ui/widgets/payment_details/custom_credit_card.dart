import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({
    super.key,
    required this.formkey,
    required this.autovalidateMode,
  });
  final GlobalKey<FormState> formkey;
  final AutovalidateMode autovalidateMode;
  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';

  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          onCreditCardWidgetChange: (CreditCardBrand brand) {},
          bankName: 'Name of the Bank',
          cardBgColor: Colors.black87,
          // glassmorphismConfig: Glassmorphism.defaultConfig(),
          enableFloatingCard: true,
          floatingConfig: const FloatingConfig(
            isGlareEnabled: true,
            isShadowEnabled: true,
            shadowConfig: FloatingShadowConfig(),
          ),
          // backgroundImage: 'assets/card_bg.png',
          // backgroundNetworkImage: 'https://www.xyz.com/card_bg.png',
          labelValidThru: 'VALID\nTHRU',
          obscureCardNumber: true,
          obscureInitialCardNumber: false,
          obscureCardCvv: true,
          // labelCardHolder: 'CARD HOLDER',
          // // labelValidThru: 'VALID\nTHRU',
          cardType: CardType.mastercard,
          isHolderNameVisible: true,
          height: 275.h,
          // textStyle: TextStyle(color: Colors.yellowAccent),
          width: MediaQuery.of(context).size.width,
          isChipVisible: true,
          isSwipeGestureEnabled: true,
          animationDuration: Duration(milliseconds: 1000),
          frontCardBorder: Border.all(color: Colors.grey),
          backCardBorder: Border.all(color: Colors.grey),
          chipColor: Colors.red,
          padding: 16,
          // customCardTypeIcons: <CustomCardTypeIcons>[
          //   CustomCardTypeIcons(
          //     cardType: CardType.mastercard,
          //     cardImage: Image.asset(
          //       'assets/mastercard.png',
          //       height: 48,
          //       width: 48,
          //     ),
          //   ),
          // ],
        ),
        CreditCardForm(
          formKey: widget.formkey, // Required
          cardNumber: cardNumber, // Required
          expiryDate: expiryDate, // Required
          cardHolderName: cardHolderName, // Required
          cvvCode: cvvCode, // Required
          // cardNumberKey: cardNumberKey,
          // cvvCodeKey: cvvCodeKey,
          // expiryDateKey: expiryDateKey,
          // cardHolderKey: cardHolderKey,
          onCreditCardModelChange: (CreditCardModel data) {
            cardHolderName = data.cardHolderName;
            expiryDate = data.expiryDate;
            cardNumber = data.cardNumber;
            cvvCode = data.cvvCode;
            showBackView = data.isCvvFocused;
            setState(() {});
          }, // Required
          obscureCvv: true,
          obscureNumber: true,
          isHolderNameVisible: true,
          isCardNumberVisible: true,
          isExpiryDateVisible: true,
          enableCvv: true,
          cvvValidationMessage: 'Please input a valid CVV',
          dateValidationMessage: 'Please input a valid date',
          numberValidationMessage: 'Please input a valid number',
          // cardNumberValidator: (String? cardNumber) {},
          // expiryDateValidator: (String? expiryDate) {},
          // cvvValidator: (String? cvv) {},
          // cardHolderValidator: (String? cardHolderName) {},
          onFormComplete: () {
            // callback to execute at the end of filling card data
          },
          autovalidateMode: widget.autovalidateMode,
          disableCardNumberAutoFillHints: false,
          inputConfiguration: const InputConfiguration(
            cardNumberDecoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Number',
              hintText: 'XXXX XXXX XXXX XXXX',
            ),
            expiryDateDecoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Expired Date',
              hintText: 'XX/XX',
            ),
            cvvCodeDecoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'CVV',
              hintText: 'XXX',
            ),
            cardHolderDecoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Card Holder',
            ),
            cardNumberTextStyle: TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
            cardHolderTextStyle: TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
            expiryDateTextStyle: TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
            cvvCodeTextStyle: TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
