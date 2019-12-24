import 'package:flutter/material.dart';

import './Screens/tab_screen.dart';
import './Screens/profile_screen.dart';
import './Screens/add_post_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/profile':(context)=>ProfileScreen(),
        '/addpost':(context)=>AddPostScreen(),
      },
    );
  }
}

