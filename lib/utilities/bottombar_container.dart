import 'package:flutter/material.dart';
import 'package:timbu_api_app/screens/shipping_add.dart';

class BottomBar extends StatelessWidget {
  final double totalPrice;
  const BottomBar({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.surface,
            offset: const Offset(0, -1),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cart totals',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                'Total: ₦${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.blue[800],
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ShippingAddress(),
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.blue[900],
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: Text(
              'Checkout',
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
