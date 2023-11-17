import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Views/main_screen.dart';
import 'contants.dart';
import 'custom_stackicon.dart';

class CustomNavigationBar extends StatefulWidget {
  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final BottomNavController _controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int currentIndexValue = _controller.currentIndex.value;
      return Stack(
        clipBehavior: Clip.none, children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, -3),
                ),
              ],
            ),
            child: Row(
              children: [
                CustomSizedBox.widthBox(0.02),
                _buildNavItem('assets/icon_people.png', "People", 0, currentIndexValue),
                _buildNavItem('assets/icon_discussion.png', "Discussion", 1, currentIndexValue),
                CustomSizedBox.widthBox(0.22),
                _buildNavItem('assets/icon_equipe.png', "Equipe", 2, currentIndexValue),
                _buildNavItem('assets/icon_logout.png', "Logout", 3, currentIndexValue)

              ],
            ),
          ),
        Positioned(
          top: -MediaQuery.of(context).size.width * 0.1, // Adjust this multiplier as needed
          left: MediaQuery.of(context).size.width / 2 - 30, // Centered horizontally
          child: CustomStackIcon(),
        ),
        ],
      );
    });
  }

  Widget _buildNavItem(String imagePath, String label, int index, int currentIndexValue) {
    return GestureDetector(
      onTap: () => _controller.changeTabIndex(index),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Image.asset(
                imagePath,
                width: 24,
                height: 24,
                color: index == 3
                    ? Colors.red
                    : currentIndexValue == index
                    ? primary
                    : secondary,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: index == 3
                    ? secondary
                    : currentIndexValue == index
                    ? primary
                    : secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
