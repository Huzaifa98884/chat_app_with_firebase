import 'package:flutter/material.dart';

class CustomChatTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  CustomChatTextField({required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red[200], // Grey background color
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none, // No border
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
