import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timbu_api_app/providers/constants.dart';
import 'package:timbu_api_app/screens/checkout_ship.dart';
import 'package:timbu_api_app/screens/review.dart';
import 'package:timbu_api_app/utilities/my_button.dart';
import 'package:timbu_api_app/utilities/my_textfield.dart';
import 'package:timbu_api_app/utilities/snackbar.dart';

class PaymentCheckout extends StatefulWidget {
  const PaymentCheckout({super.key});

  @override
  State<PaymentCheckout> createState() => _PaymentCheckoutState();
}

class _PaymentCheckoutState extends State<PaymentCheckout> {
  String? _selectedPayment;
  bool _isChecked = false;
  final _cardController = TextEditingController();
  final _cvvController = TextEditingController();
  final _expirationController = TextEditingController();
  final _voucherController = TextEditingController();

  void removeFocus() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: removeFocus,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          automaticallyImplyLeading: false,
          title: const Text(
            'Checkout',
            style: TextStyle(
                fontWeight: kFontWeightMedium, fontSize: kFontSizeBig),
          ),
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const CheckoutShip(),
              ),
            ),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20.0,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CheckoutShip(),
                            ),
                          ),
                          child: Icon(Icons.local_shipping,
                              color: Colors.blue[800]),
                        ),
                        Text(
                          'Shipping',
                          style: TextStyle(color: Colors.blue[800]),
                        ),
                      ],
                    ),
                    const Text(
                      '-----',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaymentCheckout(),
                            ),
                          ),
                          child: Icon(Icons.payment, color: Colors.blue[800]),
                        ),
                        Text(
                          'Payment',
                          style: TextStyle(color: Colors.blue[800]),
                        ),
                      ],
                    ),
                    const Text(
                      '-----',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ReviewScreen(),
                                  ),
                                ),
                            child: const Icon(
                              Icons.rate_review,
                              color: kgrey,
                            )),
                        const Text(
                          'Review',
                          style: TextStyle(color: kgrey),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Payment Method',
                  style: TextStyle(
                    fontWeight: kFontWeightBold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedPayment = 'Credit Card';
                          });
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 25),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: _selectedPayment == 'Credit Card'
                                    ? Colors.blue
                                    : Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'lib/images/mc_symbol.svg',
                                    height: 40,
                                    width: 40,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text('Credit Card',
                                      style: TextStyle(
                                        fontWeight: kFontWeightMedium,
                                        fontSize: 20,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedPayment = 'Google Play';
                          });
                        },
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 25),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: _selectedPayment == 'Google Play'
                                    ? Colors.blue
                                    : Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'lib/images/google-play-svgrepo-com.svg',
                                    height: 40,
                                    width: 40,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Google Play',
                                    style: TextStyle(
                                      fontWeight: kFontWeightMedium,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Card number',
                  style: TextStyle(
                    fontWeight: kFontWeightBold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: kFontSize,
                  ),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: _cardController,
                  hintText: 'xxx xxx xxx',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Expiration',
                            style: TextStyle(
                              fontWeight: kFontWeightBold,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize: kFontSize,
                            ),
                          ),
                          const SizedBox(height: 10),
                          MyTextField(
                            controller: _expirationController,
                            hintText: 'mm/yy',
                            obscureText: false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CVV',
                            style: TextStyle(
                              fontWeight: kFontWeightBold,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize: kFontSize,
                            ),
                          ),
                          const SizedBox(height: 10),
                          MyTextField(
                            controller: _cvvController,
                            hintText: 'xxx',
                            obscureText: false,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                // voucher code
                const SizedBox(height: 10),
                Text(
                  'Voucher Code',
                  style: TextStyle(
                    fontWeight: kFontWeightBold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: kFontSize,
                  ),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: _voucherController,
                  hintText: 'xxxxx',
                  obscureText: false,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      checkColor: Theme.of(context).colorScheme.tertiary,
                      activeColor: Colors.blue[900],
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    const Flexible(
                      child: Text(
                        'I have designated my shipping address to also serve my billing address',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 50),
                MyButton(
                  onTap: () {
                    showSnackbar(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReviewScreen(),
                      ),
                    );
                  },
                  buttonName: 'Confirm and continue',
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
