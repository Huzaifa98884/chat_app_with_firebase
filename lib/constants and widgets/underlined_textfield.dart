
import 'package:flutter/material.dart';
import 'contants.dart';

class UnderlinedTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscureText;
  final bool autofocus;
  final Color textColor;
  final Color underlineColor;
  final Function(String?)? validator;

  const UnderlinedTextField({
    Key? key,
    required this.label,
    required this.controller,
    required this.textInputType,
    this.obscureText = false,
    this.autofocus = false,
    this.textColor = Colors.black,
    this.underlineColor = Colors.grey,
    this.validator,
  }) : super(key: key);

  @override
  _UnderlinedTextFieldState createState() => _UnderlinedTextFieldState();
}

class _UnderlinedTextFieldState extends State<UnderlinedTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontFamily: "SF Pro Text",
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Color(0xff000000),
            height: 22 / 13,
          ),
        ),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.textInputType,
          obscureText: widget.obscureText && !_isPasswordVisible,
          autofocus: widget.autofocus,
          style: TextStyle(
            color: widget.textColor,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: widget.textColor),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: widget.underlineColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: widget.underlineColor),
            ),
            suffixIcon: widget.obscureText
                ? IconButton(
              icon: Icon(
                _isPasswordVisible
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            )
                : null, // No icon
          ),
          validator: widget.validator as String? Function(String?)?,
        ),
      ],
    );
  }
}
