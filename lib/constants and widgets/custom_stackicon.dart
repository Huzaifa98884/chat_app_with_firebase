import 'package:flutter/material.dart';

class CustomStackIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      child: Stack(
        children: [
          // First image
          Positioned.fill(
            child: Image.asset(
              'assets/greenlightimage.png', // Replace with your image asset
              fit: BoxFit.cover,
            ),
          ),
          // Second image with padding and centered
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            bottom: 10,
            child: Image.asset(
              'assets/greendarkimage.png', // Replace with your image asset
              fit: BoxFit.cover,
            ),
          ),
          // Third image with padding and centered
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            bottom: 20,
            child: Image.asset(
              'assets/soccer.png', // Replace with your image asset
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
