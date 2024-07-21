import 'package:flutter/material.dart';
import 'package:timbu_api_app/providers/constants.dart';
import 'package:timbu_api_app/screens/checkout_ship.dart';
import 'package:timbu_api_app/screens/payment.dart';
import 'package:timbu_api_app/screens/product_list_screen.dart';
import 'package:timbu_api_app/utilities/my_button.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              builder: (context) => const PaymentCheckout(),
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
                          child: Icon(
                            Icons.rate_review,
                            color: Colors.blue[800],
                          )),
                      Text(
                        'Review',
                        style: TextStyle(color: Colors.blue[800]),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Detail(
                title: 'Ship To',
                subtitle: 'My Home',
                address: '67 Stoneway Street, Abuja\nNigeria, 94054',
              ),
              const SizedBox(height: 10),
              const Divider(
                height: 20,
                thickness: 1.0,
                color: kgrey,
              ),
              const SizedBox(height: 10),
              const Detail(
                title: 'Delivery',
                subtitle: 'Instant Delivery',
                address: '30-40 mins By Mon, June 24',
              ),
              const SizedBox(height: 10),
              const Divider(
                height: 20,
                thickness: 1.0,
                color: kgrey,
              ),
              const SizedBox(height: 10),
              const Detail(
                title: 'Payment',
                subtitle: 'Credit Card',
                address: '24/2024',
              ),
              const SizedBox(height: 10),
              const Divider(
                height: 20,
                thickness: 1.0,
                color: kgrey,
              ),
              const SizedBox(height: 10),
              const Detail(
                title: 'Items(6)',
                subtitle: '',
                address: '',
              ),
              const SizedBox(height: 10),
              const Divider(
                height: 20,
                thickness: 1.0,
                color: kgrey,
              ),
              const SizedBox(height: 20),
              const CheckoutSummary(),
              const SizedBox(height: 50),
              MyButton(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 50.0,
                                ),
                                const SizedBox(height: 16.0),
                                const Text(
                                  'Thanks for your order!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                const Text(
                                  'The order confirmation has been sent to test@gmail.com.com',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                const SizedBox(height: 16.0),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ProductListScreen(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 32.0,
                                      vertical: 12.0,
                                    ),
                                    backgroundColor: Colors.blue[900],
                                    textStyle: const TextStyle(fontSize: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'Continue shopping',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  buttonName: 'Place Order'),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  final String title;
  final String subtitle;
  final String address;

  const Detail({
    super.key,
    required this.title,
    required this.subtitle,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 10.0),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: kFontSize,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      address,
                      style: const TextStyle(
                        fontSize: kFontSize,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.black54),
        ],
      ),
    );
  }
}

class CheckoutSummary extends StatelessWidget {
  const CheckoutSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Subtotal',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_drop_down_sharp, color: Colors.black54),
          ],
        ),
        const SizedBox(height: 8.0),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '6x Items Product',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: kgrey,
              ),
            ),
            Text(
              '₦7,800,000.00',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: kgrey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: kgrey,
              ),
            ),
            Text(
              '₦10,000.00',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: kgrey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Discount',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: kgrey,
              ),
            ),
            Text(
              '-₦20,000.00',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: kgrey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tax',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: kgrey,
              ),
            ),
            Text(
              '₦5,000.00',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: kgrey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(
          height: 20,
          thickness: 1.0,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text(
              '₦7,800,000.00',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
                color: Colors.blue[900],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
