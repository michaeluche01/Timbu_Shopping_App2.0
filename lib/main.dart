import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timbu_api_app/onboard_screen.dart';
import 'package:timbu_api_app/themes/lightmode.dart';
import 'providers/product_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        theme: lightMode,
        debugShowCheckedModeBanner: false,
        home: const OnboardingScreen(),
      ),
    );
  }
}
