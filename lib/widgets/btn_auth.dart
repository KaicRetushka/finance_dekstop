import 'package:flutter/material.dart';

class BtnAuth extends StatelessWidget {
  const BtnAuth({super.key, required this.fun, required this.text});

  final VoidCallback fun;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 40,
      margin: EdgeInsets.only(top: 15),
      child: FilledButton(
        onPressed: fun,
        style: FilledButton.styleFrom(backgroundColor: Colors.blue),
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
