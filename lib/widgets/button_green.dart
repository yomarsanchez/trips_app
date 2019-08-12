import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ButtonGreen extends StatefulWidget {
  final String text;
  double width = 0.0;
  double height = 0.0;
  final VoidCallback onPressed;

  ButtonGreen({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.width,
    this.height
  });

  @override
  State<StatefulWidget> createState() {
    return _ButtonGreen();
  }
}

class _ButtonGreen extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        width: widget.width,
        height: widget.height,
        margin: EdgeInsets.only(
          top: 30.0,
          left: 20.0,
          right: 20.0
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.height * .2)
          ),
          gradient: LinearGradient(
            begin: FractionalOffset(0.2, 0.0),
            end: FractionalOffset(1.0, 0.6),
            colors: [
              Color(0xFFA7FF84), /// Color Top
              Color(0xFF1CBB78), /// Color Botton
            ],
            stops: [0.0,0.6],
            tileMode: TileMode.clamp
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(-2, 2),
              blurRadius: widget.height * .1,
              spreadRadius: 1.2
            )
          ]
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                right: 10.0
              ),
              child: Icon(
                MdiIcons.google,
                color: Colors.white,
              ),
            ),
            Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                fontFamily: "Lato"
              ),
            ),
          ],
        ),
      ),
    );
  }
}
