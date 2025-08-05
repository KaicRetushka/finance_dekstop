import 'package:flutter/material.dart';

class MiniBtnAuth extends StatelessWidget {
  const MiniBtnAuth({super.key, required this.text, required this.routeName});

  final String text;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.black),
        ),
        style: TextButton.styleFrom(
            foregroundColor: Colors.blue.withAlpha(127)
        ),
      ),
    );
  }
}
