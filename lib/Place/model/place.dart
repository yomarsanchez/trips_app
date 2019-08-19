import 'package:flutter/material.dart';

class Place {
  String id;
  final String name;
  final String description;
  final String type;
  final String urlImage;
  int likes;
  // User userOwner;

  Place({
    Key key,
    @required this.name,
    @required this.description,
    @required this.type,
    @required this.urlImage,
    this.likes = 0,
    // this.userOwner
  });
}
