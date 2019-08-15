import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String placeholder;
  final TextInputType type;
  final TextEditingController controller;
  int maxLines;

  TextInput({
    Key key,
    @required this.placeholder,
    @required this.type,
    @required this.controller,
    this.maxLines = 1
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20.0,
        right: 20.0
      ),
      child: TextField(
        controller: this.controller,
        keyboardType: this.type,
        maxLines: this.maxLines,
        style: TextStyle(
          color: Colors.blueGrey,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: "Lato"
        ),
        decoration: InputDecoration(
          filled: true,
          hintText: this.placeholder,
          fillColor: Color(0xFFE0E1E2),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE0E1E2)),
            borderRadius: BorderRadius.all(Radius.circular(9.0))
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE0E1E2)),
            borderRadius: BorderRadius.all(Radius.circular(9.0))
          )
        ),
      ),
    );
  }

}
