import 'package:flutter/material.dart';
import 'package:timbu_api_app/providers/constants.dart';
import 'package:timbu_api_app/screens/checkout_ship.dart';
import 'package:timbu_api_app/screens/product_list_screen.dart';
import 'package:timbu_api_app/utilities/my_button.dart';
import 'package:timbu_api_app/utilities/my_textfield.dart';
import 'package:timbu_api_app/utilities/region_dopdown.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void removeFocus() {
      FocusScope.of(context).unfocus();
    }

    return GestureDetector(
      onTap: removeFocus,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          automaticallyImplyLeading: false,
          title: const Text(
            'Shipping Address',
            style: TextStyle(fontWeight: kFontWeightMedium, fontSize: 22),
          ),
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductListScreen(),
              ),
            ),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20.0,
            ),
          ),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Shipping to *',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                MyTextField(
                  controller: _nameController,
                  hintText: 'Home',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Full Name *',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                MyTextField(
                  controller: _nameController,
                  hintText: 'Enter your full name',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Country *',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                MyTextField(
                  controller: _nameController,
                  hintText: 'Nigeria',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Address *',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                MyTextField(
                  controller: _nameController,
                  hintText: 'Street Address',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                const Text(
                  'City',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                MyTextField(
                  controller: _nameController,
                  hintText: '',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Postal Code *',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: MyTextField(
                        controller: _nameController,
                        hintText: '',
                        obscureText: false,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Expanded(
                      child: RegionDropDown(
                        labeltext: 'Select Region',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Phone number *',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                MyTextField(
                  controller: _nameController,
                  hintText: 'Enter your phone number',
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                MyButton(
                    onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CheckoutShip(),
                          ),
                        ),
                    buttonName: 'Save'),
                const SizedBox(height: 10),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
