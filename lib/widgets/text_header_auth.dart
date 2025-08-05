import 'package:flutter/material.dart';

class TextHeaderAuth extends StatelessWidget {
  const TextHeaderAuth({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Text(
        text,
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  }
}
