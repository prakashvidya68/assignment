import 'package:flutter/material.dart';

import './create_post_screen.dart';

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
  ];
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle,color: Colors.white,),
            onPressed: (){},
          ),
        ],
      ),
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
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
        ],
      ),
      floatingActionButton: Transform.scale(
        scale: 1.15,
        child: FloatingActionButton.extended(
          label: Text('Create'),
          onPressed: () {
            return showDialog(
              context: context,
              builder: (ctx) => SimpleDialog(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.all(10),
                    child: ListView(
                      children: <Widget>[],
                    ),
                  )
                ],
              ),
            );
          },
          icon: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
