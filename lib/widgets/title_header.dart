import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final String title;

  TitleHeader({
    Key key,
    @required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.white,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        fontFamily: "Lato"
      )
    );
  }
}
