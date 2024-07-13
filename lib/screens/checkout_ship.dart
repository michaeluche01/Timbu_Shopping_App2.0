import 'package:flutter/material.dart';
import 'package:timbu_api_app/providers/constants.dart';
import 'package:timbu_api_app/screens/payment.dart';
import 'package:timbu_api_app/screens/review.dart';
import 'package:timbu_api_app/screens/shipping_add.dart';
import 'package:timbu_api_app/utilities/my_button.dart';

class CheckoutShip extends StatefulWidget {
  const CheckoutShip({super.key});

  @override
  State<CheckoutShip> createState() => _CheckoutShipState();
}

class _CheckoutShipState extends State<CheckoutShip> {
  String? _selectedAddress;
  String? _selectedDelivery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        automaticallyImplyLeading: false,
        title: const Text(
          'Checkout',
          style:
              TextStyle(fontWeight: kFontWeightMedium, fontSize: kFontSizeBig),
        ),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ShippingAddress(),
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
                        child:
                            Icon(Icons.local_shipping, color: Colors.blue[800]),
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
                        child: const Icon(Icons.payment, color: kgrey),
                      ),
                      const Text(
                        'Payment',
                        style: TextStyle(color: kgrey),
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
              Row(
                children: [
                  Text(
                    'Address',
                    style: TextStyle(
                      fontWeight: kFontWeightBold,
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: kFontSize,
                    ),
                  ),
                  const Spacer(),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '+ '[0],
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: kFontSize,
                            color: Colors.blue[900],
                            fontWeight: kFontWeightBold,
                          ),
                        ),
                        TextSpan(
                          text: 'Add new'.substring(0),
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue[900],
                            fontSize: kFontSize,
                            color: Colors.blue[900],
                            fontWeight: kFontWeightBold,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedAddress = 'My Home';
                  });
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: _selectedAddress == 'My Home'
                            ? Colors.blue
                            : Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('My Home',
                              style: TextStyle(
                                fontWeight: kFontWeightBold,
                                fontSize: kFontSize,
                              )),
                          Text('67 Stoneway Street, Abuja\nNigeria, 94054'),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.edit_outlined,
                        color: Colors.blue[800],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedAddress = 'Office';
                  });
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: _selectedAddress == 'Office'
                            ? Colors.blue
                            : Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Office',
                              style: TextStyle(
                                fontWeight: kFontWeightBold,
                                fontSize: kFontSize,
                              )),
                          Text('67 Kwaji Street, Abuja\nNigeria, 94054'),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.edit_outlined,
                        color: Colors.blue[800],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Delivery estimate',
                style: TextStyle(
                  fontWeight: kFontWeightBold,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: kFontSize,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDelivery = 'Instant Delivery';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: _selectedDelivery == 'Instant Delivery'
                            ? Colors.blue
                            : Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.local_shipping_rounded),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Instant Delivery',
                            style: TextStyle(
                              fontWeight: kFontWeightBold,
                              fontSize: kFontSize,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '30-40 mins',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ],
                      ),
                      // Spacer(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDelivery = 'Standard Delivery';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: _selectedDelivery == 'Standard Delivery'
                            ? Colors.blue
                            : Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.local_shipping),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Standard Delivery',
                            style: TextStyle(
                              fontWeight: kFontWeightBold,
                              fontSize: kFontSize,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Same Day',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              MyButton(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentCheckout(),
                  ),
                ),
                buttonName: 'Next',
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
