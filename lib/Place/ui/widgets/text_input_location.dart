import 'package:flutter/material.dart';

class TextInputLocation  extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final IconData icon;

  TextInputLocation({
    Key key,
    @required this.placeholder,
    @required this.icon,
    @required this.controller
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
        style: TextStyle(
          color: Colors.blueGrey,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: "Lato"
        ),
        decoration: InputDecoration(
          filled: true,
          hintText: this.placeholder,
          fillColor: Color(0xFFFFFFFF),
          suffixIcon: Icon(this.icon, size: 28.0),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
            borderRadius: BorderRadius.all(Radius.circular(15.0))
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
            borderRadius: BorderRadius.all(Radius.circular(15.0))
          )
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black12,
            blurRadius:  15.0,
            offset: Offset(0.0, 7.0)
          ),
        ]
      ),
    );
  }
}
