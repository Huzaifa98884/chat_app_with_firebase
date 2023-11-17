import 'package:chat_appwith_firebase/Views/people_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants and widgets/custom_navbar.dart';
import 'discussion_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }

  Widget _buildBody() {
    return Obx(() {
      int currentIndex = Get.find<BottomNavController>().currentIndex.value;
      switch (currentIndex) {
        case 0:
          return PeopleScreen();
        case 1:
          return DiscussionScreen();
        default:
          return Container();
      }
    });
  }

}

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}

