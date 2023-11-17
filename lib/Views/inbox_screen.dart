import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InboxScreen extends StatefulWidget {
  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  String? url;
  File? imageFile;
  XFile? pickedFile;
  _getFromGallery() async {
    pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    File image = File(pickedFile!.path);
    if (pickedFile != null) {
      setState(() {
        imageFile = image;
      });
    }
  }
  List<Message> messages = [
    Message(
      text: 'Good morning, did you sleep well?',
      isSender: true,
      timestamp: DateTime.now(),
    ),
    Message(
      text: 'Good morning, did you sleep well?',
      isSender: false,
      timestamp: DateTime.now(),
    ),
  ];

  TextEditingController textEditingController = TextEditingController();

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
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageWidget(message: messages[index]);
              },
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),

          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.image, size: MediaQuery.of(context).size.height*0.03,),
                onPressed: () {
                  _getFromGallery();
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      isDense: true,
                      hintText: 'Type a message...',
                      border: InputBorder.none,
                      fillColor: Color(0xFFF7F7FC), // Set the background color
                      filled: true, // Ensure the background color is applied
                    ),
                  ),
                ),
              ),
              IconButton(
                color: Colors.white,
                icon: Image.asset("assets/sendIcon.png", height: MediaQuery.of(context).size.height*0.03,),
                onPressed: () {
                  _sendMessage(textEditingController.text);
                },
              ),
            ],
          ),
        ),

        if (imageFile != null)
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: MediaQuery.of(context).size.height *0.2,
                    width: MediaQuery.of(context).size.width *0.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0, -4),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Image.file(imageFile!,height: MediaQuery.of(context).size.height *0.2,
                          width: MediaQuery.of(context).size.width *0.3,
                        fit: BoxFit.cover,),
                        Positioned(
                          top: 0.0,
                          right: 0.0,

                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: GestureDetector(
                              onTap: () {
                                // Handle close button tap
                                setState(() {
                                  imageFile = null;
                                });
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
            ],
          )
      ],
    );
  }

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      setState(() {
        messages.add(Message(
          text: text,
          isSender: true,
          timestamp: DateTime.now(),
        ));
        textEditingController.clear();
      });
    }
  }
}

class Message {
  final String text;
  final bool isSender;
  final DateTime timestamp;

  Message({
    required this.text,
    required this.isSender,
    required this.timestamp,
  });
}

class MessageWidget extends StatelessWidget {
  final Message message;

  MessageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: message.isSender
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          padding: EdgeInsets.all(12.0),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width*0.8, // Set your maximum width
          ),
          decoration: BoxDecoration(
            color: message.isSender ? Color(0xff14ae5c) : Colors.grey[300],
            borderRadius: message.isSender ? BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10),bottomLeft: Radius.circular(10), bottomRight: Radius.circular(0)) : BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10),bottomLeft: Radius.circular(0), bottomRight: Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.text,
                style: TextStyle(fontSize: 16.0,
                  color: message.isSender ? Colors.white : Colors.black,),
              ),
              SizedBox(height: 4.0),
              Text(

                _formatTimestamp(message.timestamp),
                textAlign: message.isSender ? TextAlign.right:TextAlign.left,
                style: TextStyle(fontSize: 12.0, color: message.isSender ? Colors.white : Colors.black,),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    // Implement your own timestamp formatting logic
    return "${timestamp.hour}:${timestamp.minute}";
  }
}
