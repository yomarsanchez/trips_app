import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  final IconData icon;
  var color;
  final double iconSize;
  final VoidCallback onPressed;
  final bool isMiniIcon;

  CircleButton({
    @required this.icon,
    @required this.color,
    @required this.iconSize,
    @required this.onPressed,
    this.isMiniIcon = false
  });

  @override
  State<StatefulWidget> createState() {
    return _CircleButton();
  }

}

class _CircleButton extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FloatingActionButton(
          backgroundColor: widget.color,
          mini: widget.isMiniIcon,
          onPressed: widget.onPressed,
          child: Icon(
            widget.icon,
            size: widget.iconSize,
            color: Color(0xFF4268D3),
          ),
          heroTag: null,
        )
    );
  }
}
