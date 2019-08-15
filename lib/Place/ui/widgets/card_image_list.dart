import 'package:flutter/material.dart';
import 'package:trips_app/Place/ui/widgets/card_image_with_fab_icon.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      margin: EdgeInsets.only(
        top: 80.0,
        left: 0.0
      ),
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImageWithFabIcon(
            image: "assets/img/img-1.jpg",
            height: 250.0,
            width: 250.0,
            icon: Icons.favorite_border,
            onPressedTabIcon : () {},
            left: 20
          ),
          CardImageWithFabIcon(
            image: "assets/img/img-2.jpg",
            height: 250.0,
            width: 250.0,
            icon: Icons.favorite_border,
            onPressedTabIcon : () {},
            left: 20
          ),
          CardImageWithFabIcon(
            image: "assets/img/img-4.jpg",
            height: 250.0,
            width: 250.0,
            icon: Icons.favorite_border,
            onPressedTabIcon : () {},
            left: 20
          ),
          CardImageWithFabIcon(
            image: "assets/img/img-6.jpg",
            height: 250.0,
            width: 250.0,
            icon: Icons.favorite_border,
            onPressedTabIcon : () {},
            left: 20
          ),
          CardImageWithFabIcon(
            image: "assets/img/img-7.jpg",
            height: 250.0,
            width: 250.0,
            icon: Icons.favorite_border,
            onPressedTabIcon : () {},
            left: 20
          ),
        ],
      ),
    );
  }

}
