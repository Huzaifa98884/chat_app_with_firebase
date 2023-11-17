import 'package:chat_appwith_firebase/Views/chat_screen.dart';
import 'package:chat_appwith_firebase/Views/discussion_screen.dart';
import 'package:chat_appwith_firebase/Views/inbox_screen.dart';
import 'package:chat_appwith_firebase/Views/login_screen.dart';
import 'package:chat_appwith_firebase/Views/main_screen.dart';
import 'package:chat_appwith_firebase/Views/people_screen.dart';
import 'package:chat_appwith_firebase/Views/signup_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes{

  static final Map<String, WidgetBuilder> routes = {
    '/login' : (context) => LoginScreen(),
    '/signup' : (context) => SignupScreen(),
    '/people' : (context) => PeopleScreen(),
    '/discussion' : (context) => DiscussionScreen(),
    '/main' : (context) => MainScreen(),
    '/chat' : (context) => ChatScreen(),
    '/inbox': (cotext) => InboxScreen()

  };

}