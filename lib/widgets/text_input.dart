import 'package:flutter/material.dart';

class TextInput extends StatelessWidget{
  final String label;
  final TextInputType inputType;
  final TextEditingController controller;
  int maxLines = 1;

  TextInput({
    Key key,
    @required this.label,
    @required this.inputType,
    @required this.controller,
    this.maxLines
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20.0,
        right: 20.0
      ),
      child: Text(''),
    );
  }

}
