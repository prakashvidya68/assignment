import 'package:flutter/material.dart';

class CreatePostScreen extends StatelessWidget {
  final TextEditingController titleController = new TextEditingController();
  final TextEditingController bodyController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    String title;
    String body;

    return Container(
        child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            // textCapitalization: TextCapitalization.words,
            textCapitalization: TextCapitalization.words,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Your intresting blog title goes here..',
              labelText: 'Title: ',
            ),
            // controller: titleController,
            onChanged: (val) {
              title = val;
              print(title);
            },
          ),
        ),
        SizedBox(
          height: 500 ,
          child: TextFormField(
            decoration: InputDecoration(
               
              border: OutlineInputBorder(
                
              )
            ),
            controller: bodyController,
            onChanged: (val) {
              body = val;
              print(body);
            },
          ),
        ),
      ],
    ),
    
    );
  }
}
