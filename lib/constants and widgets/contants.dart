import 'package:flutter/material.dart';

Color primary = Color(0xFF14AE5C);
Color secondary = Color(0xFFCFCFCF);

class CustomSizedBox {
  static SizedBox heightBox(double heightFraction) {
    return SizedBox(
      height: MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
          .size
          .height *
          heightFraction,
    );
  }

  static SizedBox widthBox(double widthFraction) {
    return SizedBox(
      width: MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
          .size
          .width *
          widthFraction,
    );
  }
}
class CustomFunction {

  static getCurrentTime(){

  DateTime now = DateTime.now();
  String formattedTime = '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  return formattedTime;

}

}
