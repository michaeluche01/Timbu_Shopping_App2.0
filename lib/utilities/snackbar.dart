import 'package:flutter/material.dart';

void showSnackbar(BuildContext context) {
  final snackBar = SnackBar(
    content: const Text(
      'Information saved successfully!',
      style: TextStyle(color: Colors.black),
    ),
    duration: const Duration(seconds: 1),
    backgroundColor: Colors.grey[300],
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
