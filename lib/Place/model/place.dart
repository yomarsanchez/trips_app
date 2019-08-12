import 'package:flutter/material.dart';
import 'package:trips_app/User/model/user.dart';

class Place {
  String id;
  final String name;
  final String description;
  final String type;
  final String image;
  final int likes;
  User userOwner;

  Place({
    Key key,
    @required this.name,
    @required this.description,
    @required this.type,
    @required this.image,
    this.likes,
    this.userOwner
  });
}
