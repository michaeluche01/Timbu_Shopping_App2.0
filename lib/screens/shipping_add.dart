import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:timbu_api_app/providers/constants.dart';
import 'package:timbu_api_app/screens/checkout_ship.dart';
import 'package:timbu_api_app/screens/product_list_screen.dart';
import 'package:timbu_api_app/utilities/custom_dropdown.dart';
import 'package:timbu_api_app/utilities/my_button.dart';
import 'package:timbu_api_app/utilities/my_textfield.dart';
import 'package:timbu_api_app/utilities/region_dopdown.dart';
import 'package:http/http.dart' as http;

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _pcodeController = TextEditingController();
  // final _shippingController = TextEditingController();
  final _countryController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();

  Future<void> insertShippingAddress() async {
    if (_nameController.text != "" ||
        _countryController.text != "" ||
        _streetController.text != "" ||
        _cityController.text != "" ||
        _pcodeController.text != "" ||
        _phoneController.text != "") {
      try {
        String uri =
            'http://127.0.0.1/timbustore_api/insert_shipping_records.php';
        var res = await http.post(Uri.parse(uri), body: {
          "fullname": _nameController.text,
          "country": _countryController.text,
          "address": _streetController.text,
          "city": _cityController.text,
          "postalcode": _pcodeController.text,
          "phone": _phoneController.text,
        });

        var response = jsonDecode(res.body);
        if (response["success"] == "trus") {
          print("Shipping Records Inserted --> GREAT jOB MICHAELUCHE");
        } else {
          print('Omooooo Error Encountered!!!');
        }
      } catch (e) {
        print(e);
      }
    } else {
      print('Please fill all required fields');
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const CheckoutShip(),
      ),
    );
  }

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
                const SippingTo(),
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
                  controller: _countryController,
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
                  controller: _streetController,
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
                  controller: _cityController,
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
                        controller: _pcodeController,
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
                  controller: _phoneController,
                  hintText: 'Enter your phone number',
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                MyButton(onTap: insertShippingAddress, buttonName: 'Save'),
                const SizedBox(height: 10),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

//Dropdown for shipping

class SippingTo extends StatefulWidget {
  const SippingTo({super.key});

  @override
  State<SippingTo> createState() => _SippingToState();
}

class _SippingToState extends State<SippingTo> {
  String _selectedItem = '1';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdownField<String>(
          label: 'Select shipping location',
          value: _selectedItem,
          items: const [
            DropdownMenuItem(value: '1', child: Text('Home')),
            DropdownMenuItem(value: '2', child: Text('Work')),
          ],
          onChanged: (value) {
            setState(() {
              _selectedItem = value!;
            });
          },
        ),
      ],
    );
  }
}
