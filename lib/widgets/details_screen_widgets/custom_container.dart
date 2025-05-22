// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  Widget child;
  CustomContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.9,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.symmetric(
          vertical: BorderSide(width: 10, color: Colors.grey),
        ),
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 222, 218, 218),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
      ),
      child: child,
    );
  }
}
