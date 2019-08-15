import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  bool isMiniIcon;
  String tooltip;

  FloatingActionButtonGreen({
    Key key,
    @required this.icon,
    @required this.onPressed,
    this.isMiniIcon = true,
    this.tooltip = "Fav"
  });

  @override
  State<StatefulWidget> createState() => _FloatingActionButtonGreen();

}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: widget.isMiniIcon,
      tooltip: widget.tooltip,
      onPressed: widget.onPressed,
      child: Icon(widget.icon),
      heroTag: null,
    );
  }

}
