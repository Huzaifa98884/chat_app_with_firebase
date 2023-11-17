import 'package:chat_appwith_firebase/constants%20and%20widgets/custom_discussionwidget.dart';
import 'package:flutter/material.dart';

import '../constants and widgets/contants.dart';
import '../constants and widgets/custom_searchbar.dart';

class DiscussionScreen extends StatefulWidget {
  const DiscussionScreen({Key? key}) : super(key: key);

  @override
  State<DiscussionScreen> createState() => _DiscussionScreenState();
}

class _DiscussionScreenState extends State<DiscussionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.04),
        child: Column(
          children: [
            CustomSizedBox.heightBox(0.08),
            CustomSearchBar(),
            CustomDiscussionWidget(imageUrl: "assets/random_people.png", name: "Athalia Putri", message: "Good morning, did you sleep well?", read: false,),
            CustomDiscussionWidget(imageUrl: "assets/random_people.png", name: "Erlan Sadewa", message: "Good morning, did you sleep well?", read: true,),
          ],
        ),
      ),
    );
  }
}
