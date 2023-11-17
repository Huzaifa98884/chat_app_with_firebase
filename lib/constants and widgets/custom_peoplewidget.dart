import 'package:chat_appwith_firebase/constants%20and%20widgets/contants.dart';
import 'package:flutter/material.dart';

class CustomPeopleWidget extends StatelessWidget {
  final String imageUrl;
  final String name;

  CustomPeopleWidget({required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: MediaQuery.sizeOf(context).width * 0.06,
              backgroundImage: AssetImage(imageUrl),
            ),
            CustomSizedBox.widthBox(0.04),
            Expanded(
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xFF0F1828),
                  fontSize: MediaQuery.sizeOf(context).width * 0.04,
                  fontFamily: 'Nexa',
                  fontWeight: FontWeight.w700,
                  height: 0.12,
                ),
              ),
            ),
          ],
        ),
        CustomSizedBox.heightBox(0.035),
      ],
    );
  }
}
