import 'package:flutter/material.dart';
import 'package:timbu_api_app/screens/homescreen.dart';
import 'package:timbu_api_app/screens/product_list_screen.dart';

class FirstScreenNav extends StatefulWidget {
  const FirstScreenNav({super.key});

  @override
  State<FirstScreenNav> createState() => _FirstScreenNavState();
}

class _FirstScreenNavState extends State<FirstScreenNav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: _selectedIndex == 0
          ? const HomeScreen()
          : const ProductListScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: <Widget>[
                Icon(Icons.shopping_cart),
                // if (_checkoutItems.isNotEmpty)
                //   Positioned(
                //     right: 0,
                //     child: Container(
                //       padding: const EdgeInsets.all(1),
                //       decoration: BoxDecoration(
                //         color: Colors.black,
                //         borderRadius: BorderRadius.circular(6),
                //       ),
                //       constraints: const BoxConstraints(
                //         minWidth: 13,
                //         minHeight: 13,
                //       ),
                //       child: Text(
                //         '${_checkoutItems.length}',
                //         style: const TextStyle(
                //             color: Colors.white,
                //             fontSize: 8,
                //             fontWeight: FontWeight.bold),
                //         textAlign: TextAlign.center,
                //       ),
                //     ),
                //   ),
              ],
            ),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[900],
        onTap: _onItemTapped,
      ),
    );
  }
}
