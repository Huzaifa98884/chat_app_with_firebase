import 'package:chat_appwith_firebase/AppRoutes/routes.dart';
import 'package:flutter/material.dart';
import 'Views/main_screen.dart';
import 'constants and widgets/contants.dart';
import 'package:get/get.dart';

void main() {
  Get.lazyPut(() => BottomNavController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        useMaterial3: true,
      ),
      routes: AppRoutes.routes,
      initialRoute: "/login",
    );
  }
}

