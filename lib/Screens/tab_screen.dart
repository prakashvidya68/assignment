import 'package:flutter/material.dart';

import './create_post_screen.dart';
import './profile_screen.dart';
import './read_ans_screen.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainPage();
  }
}

class MainPage extends StatefulWidget {
  const MainPage({
    Key key,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> _pageOptions = [
    ReadScreen(),
    CreatePostScreen(),
    ProfileScreen(),
  ];
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text('green')),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            title: Text('black'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            title: Text('red'),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: _pageOptions[_selectedPage],
    );
  }
}





