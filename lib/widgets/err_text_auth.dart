import 'package:flutter/material.dart';

class ErrTextAuth extends StatelessWidget {
  const ErrTextAuth({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(text, style: TextStyle(color: Colors.red)),
      alignment: Alignment.topLeft,
    );
  }
}
