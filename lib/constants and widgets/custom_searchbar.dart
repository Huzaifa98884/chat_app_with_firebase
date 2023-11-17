import 'package:chat_appwith_firebase/constants%20and%20widgets/contants.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: secondary, width: 1),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  // Asset image on the left
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/Search.png', // Replace with your asset image path
                      height: 22,
                      width: 23,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 1,
                    color: secondary,
                  ),
                  CustomSizedBox.widthBox(0.03),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Rechercher...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ),
        CustomSizedBox.heightBox(0.05)
      ],
    );
  }
}