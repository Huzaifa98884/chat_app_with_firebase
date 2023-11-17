import 'package:chat_appwith_firebase/constants%20and%20widgets/contants.dart';
import 'package:chat_appwith_firebase/constants%20and%20widgets/custom_peoplewidget.dart';
import 'package:chat_appwith_firebase/constants%20and%20widgets/custom_searchbar.dart';
import 'package:flutter/material.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.06),
        child: Column(
          children: [
            CustomSizedBox.heightBox(0.08),
            CustomSearchBar(),
            CustomPeopleWidget(imageUrl: "assets/random_people.png", name: "Erlan Sadewa"),
            CustomPeopleWidget(imageUrl: "assets/random_people_2.png", name: "Mohammed Ahmed"),

          ],
        ),
      ),
    );
  }
}
