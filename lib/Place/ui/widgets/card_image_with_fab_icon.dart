import 'package:flutter/material.dart';
import 'package:trips_app/widgets/floating_action_button_green.dart';

class CardImageWithFabIcon extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final IconData icon;
  final VoidCallback onPressedTabIcon;
  double  left;
  bool isMiniIcon;

  CardImageWithFabIcon({
    Key key,
    @required this.image,
    @required this.height,
    @required this.width,
    @required this.icon,
    @required this.onPressedTabIcon,
    this.left = 0.0,
    this.isMiniIcon = true
  });

  @override
  Widget build(BuildContext context) {

    final card = Container(
      height: this.height,
      width: this.width,
      margin: EdgeInsets.only(
        left: this.left
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(this.image)
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow (
            color:  Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          ),
        ]
      ),
    );

    return Stack(
      alignment: Alignment(0.9,1.2),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(
          icon: this.icon,
          onPressed: this.onPressedTabIcon,
          isMiniIcon: this.isMiniIcon,
        ),
      ],
    );
  }

}
