import 'package:flutter/material.dart';
import 'package:chat_appwith_firebase/constants and widgets/custom_chattextfield.dart';
import 'package:get/get.dart';
import '../constants and widgets/custom_discussionwidget.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final chatController = TextEditingController();
  List<CustomDiscussionWidget> yourMessageList = [
    CustomDiscussionWidget(
      imageUrl: "assets/random_people.png",
      name: "Athalia Putri",
      message: "Good morning, did you sleep well?",
      read: false,
    ),
    CustomDiscussionWidget(
      imageUrl: "assets/random_people.png",
      name: "Erlan Sadewa",
      message: "Good morning, did you sleep well?",
      read: true,
    ),
    // Add more messages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: GestureDetector(
                      child: Image.asset(
                        'assets/back_arrow.png',
                        width: MediaQuery.sizeOf(context).width * 0.08,
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Athalia Putri',
                      style: TextStyle(
                        color: Color(0xFF0F1828),
                        fontSize: MediaQuery.sizeOf(context).width * 0.05,
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: ListView.builder(
              itemCount: yourMessageList.length,
              itemBuilder: (context, index) {
                return CustomDiscussionWidget(
                  imageUrl: yourMessageList[index].imageUrl,
                  name: yourMessageList[index].name,
                  message: yourMessageList[index].message,
                  read: yourMessageList[index].read,
                );
              },
            ),
          ),

          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          //     child: Row(
          //       children: [
          //         IconButton(
          //           onPressed: () {},
          //           icon: Image.asset(
          //             'assets/select_image.png',
          //             width: MediaQuery.of(context).size.width * 0.08,
          //           ),
          //         ),
          //         Expanded(
          //           child: CustomChatTextField(
          //             controller: chatController,
          //             hintText: "Enter Text",
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class Message {
  final String imageUrl;
  final String name;
  final String message;
  final bool read;

  Message({
    required this.imageUrl,
    required this.name,
    required this.message,
    required this.read,
  });
}



