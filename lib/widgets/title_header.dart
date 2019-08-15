import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final String title;
  double fontSize;

  TitleHeader({
    Key key,
    @required this.title,
    this.fontSize = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.white,
        fontSize: this.fontSize,
        fontWeight: FontWeight.bold,
        fontFamily: "Lato"
      )
    );
  }
}
