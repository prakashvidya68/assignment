import 'package:flutter/foundation.dart';

class Post {
  final String id;
  final String title;
  final String description;
  final String tag;
  final String imageUrl;

  Post(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.tag,
      @required this.imageUrl});
}
