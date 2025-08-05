import 'package:flutter/material.dart';

class TextFieldAuth extends StatefulWidget {
  const TextFieldAuth({
    super.key,
    required this.labelText,
    required this.controller,
    required this.obscureText,
  });

  final String labelText;
  final TextEditingController controller;
  final bool obscureText;

  @override
  State<TextFieldAuth> createState() => _TextFieldAuthState();
}

class _TextFieldAuthState extends State<TextFieldAuth> {
  late bool _obscureText;

  @override
  void initState() {
    // TODO: implement initState
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      margin: EdgeInsets.only(bottom: 5),
      child: TextSelectionTheme(
        data: TextSelectionThemeData(
          cursorColor: Colors.blue,
          selectionColor: Colors.blue.withAlpha(127),
        ),
        child: TextField(
          obscureText: _obscureText,
          style: TextStyle(
            fontSize: 20
          ),
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: TextStyle(
              fontSize: 20,
              color: Colors.grey
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            suffixIcon: widget.obscureText
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  )
                : null,
          ),
          controller: widget.controller,
        ),
      ),
    );
  }
}
