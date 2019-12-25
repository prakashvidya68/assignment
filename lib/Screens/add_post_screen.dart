import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Models/post.dart';

class AddPostScreen extends StatefulWidget {
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  var _addedpost =
      Post(id: null, title: '', description: '', tag: '', imageUrl: '');

  var initialValue = {
    'title': '',
    'description': '',
    'tag': '',
    'imageUrl': ''
  };
  // final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _tagFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _form,
            autovalidate: true,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: initialValue['title'],
                    decoration: InputDecoration(labelText: 'Title'),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(_descriptionFocusNode);
                    },
                    validator: (value) {
                      if (value.isEmpty) return "Please enter a Text";
                      return null;
                    },
                    onSaved: (value) {
                      _addedpost = Post(
                          title: value,
                          id: _addedpost.id,
                          description: _addedpost.description,
                          tag: _addedpost.tag,
                          imageUrl: _addedpost.imageUrl);
                    },
                  ),
                  TextFormField(
                    initialValue: initialValue['tag'],
                    decoration: InputDecoration(labelText: 'Tag'),
                    keyboardType: TextInputType.multiline,
                    focusNode: _tagFocusNode,
                    validator: (value) {
                      if (value.isEmpty)
                        return "Please enter the Tag";
                      else if (value.length > 10)
                        return "Description should be less than 10 letter";
                      else
                        return null;
                    },
                    onSaved: (value) {
                      _addedpost = Post(
                          title: _addedpost.title,
                          id: _addedpost.id,
                          description: _addedpost.description,
                          tag: value,
                          imageUrl: _addedpost.imageUrl);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: initialValue['description'],
                    decoration: InputDecoration(
                        labelText: 'Description', border: OutlineInputBorder()),
                    keyboardType: TextInputType.multiline,
                    maxLines: 15,
                    focusNode: _descriptionFocusNode,
                    validator: (value) {
                      if (value.isEmpty)
                        return "Please enter the Description";
                      else if (value.length < 10)
                        return "Description should be atleast 10 letter";
                      else
                        return null;
                    },
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_tagFocusNode);
                    },
                    onSaved: (value) {
                      _addedpost = Post(
                        title: _addedpost.title,
                        id: _addedpost.id,
                        description: value,
                        tag: _addedpost.tag,
                        imageUrl: _addedpost.imageUrl,
                      );
                    },
                  ),
                  SelectImage()
                ],
              ),
            ),
          ),
        ));
  }
}

class SelectImage extends StatefulWidget {
  const SelectImage({
    Key key,
  }) : super(key: key);

  @override
  _SelectImageState createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  @override
  Widget build(BuildContext context) {
    File ImageFile;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ImageFile == null
              ? Image.file(ImageFile)
              : Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                    child: Text('Preview'),
                  ),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.height * 0.15,
                ),
        ),
        RaisedButton(
          onPressed: () {
            setState(() async {
              ImageFile =
                  await ImagePicker.pickImage(source: ImageSource.gallery);
            });
          },
          child: Text('Select Image'),
        )
      ],
    );
  }
}

Widget showImage(Future<File> imageFile) {
  return FutureBuilder<File>(
    future: imageFile,
    builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
      if (snapshot.connectionState == ConnectionState.done &&
          snapshot.data != null) {
        return Image.file(
          snapshot.data,
          width: 300,
          height: 300,
        );
      } else if (snapshot.error != null) {
        return const Text(
          'Error Picking Image',
          textAlign: TextAlign.center,
        );
      } else {
        return const Text(
          'No Image Selected',
          textAlign: TextAlign.center,
        );
      }
    },
  );
}
