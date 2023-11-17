import 'package:chat_appwith_firebase/constants and widgets/contants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDiscussionWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String message;
  final bool read;

  CustomDiscussionWidget({
    required this.imageUrl,
    required this.name,
    required this.message,
    required this.read,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed('/inbox');
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.06,
                backgroundImage: AssetImage(imageUrl),
              ),
              CustomSizedBox.widthBox(0.04),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.62,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xFF0F1828),
                        fontSize: MediaQuery.of(context).size.width * 0.038,
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    CustomSizedBox.heightBox(0.01),
                    Text(
                      message,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: !read ? Colors.black : Color(0xFFA0A0A0),
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  CustomSizedBox.heightBox(0.002),
                  Text(
                    CustomFunction.getCurrentTime(),
                    style: TextStyle(
                      color: Color(0xFFA0A0A0),
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      fontFamily: 'Nexa',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  CustomSizedBox.heightBox(0.015),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.1,
                      height: MediaQuery.sizeOf(context).height * 0.015,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: !read ? Color(0xFFE94242) : Colors.white, // Customize the color as needed
                      ),
                    ),
                ],
              ),
            ],
          ),
          CustomSizedBox.heightBox(0.035),
        ],
      ),
    );
  }
}
