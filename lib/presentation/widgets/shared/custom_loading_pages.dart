import 'package:flutter/material.dart';

class CustomLoadingPages extends StatelessWidget {
  const CustomLoadingPages({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        strokeWidth: 2,
      )),
    );
  }
}
