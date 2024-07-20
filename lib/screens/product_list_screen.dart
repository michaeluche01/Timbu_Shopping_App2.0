import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timbu_api_app/models/product.dart';
import 'package:timbu_api_app/providers/constants.dart';
import 'package:timbu_api_app/utilities/bottombar_container.dart';
import '../providers/product_provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  // bool _showBottomBar = false;

  // void _toggleBottomBar() {
  //   setState(() {
  //     _showBottomBar = !_showBottomBar;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        automaticallyImplyLeading: false,
        title: const Text(
          'Shopping Cart',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: Consumer<ProductProvider>(
                  builder: (context, provider, child) {
                    return FutureBuilder(
                        future: provider.fetchProducts(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            // Access products from snapshot.data (assuming it holds the data)
                            final products = snapshot.data;

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: ListView.separated(
                                itemCount: products!.items.length,
                                itemBuilder: (context, index) {
                                  final product = products.items[index];
                                  return _buildProductItem(product);
                                },
                                separatorBuilder: (context, index) => Divider(
                                  thickness: 1.5,
                                  height: 1,
                                  color: Colors.grey[300],
                                ),
                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        });
                  },
                ),
              ),
            ),
            const BottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem(Item product) {
    String formatPrice(double price) {
      final formatter = NumberFormat('#,##0');
      return formatter.format(price.toInt());
    }

    String imgUrl =
        "$kimgurl/${product.photos.first.url}?organization_id=$korganizationId&Appid=$kappId&Apikey=$kapiKey";

    // print(imgUrl);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imgUrl,
              width: 56.0,
              height: 56.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                // Text(product.description),
                Text(
                  '₦${product.currentPrice.isNotEmpty ? formatPrice(product.currentPrice.first.prices['NGN'][0]) : 'N/A'}',
                ),
                Text(
                  product.isAvailable ? 'Available' : 'Unavailable',
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Decrease quantity
                    },
                    icon: const Icon(Icons.remove, size: 16),
                  ),
                  const Text('1'), // This should be the current quantity
                  IconButton(
                    onPressed: () {
                      // Increase quantity
                    },
                    icon: const Icon(Icons.add, size: 16),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  // Remove item
                },
                child: const Row(
                  children: [
                    Icon(Icons.delete, size: 16),
                    SizedBox(width: 3),
                    Text('Remove'),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
