
import 'package:flutter/material.dart';
class AddPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Text'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: <Widget>[
          Center(child: Text('Helloooo'))
        ],
      ),      
    );
  }
}