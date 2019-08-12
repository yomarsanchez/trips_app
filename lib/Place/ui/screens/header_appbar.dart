import 'package:flutter/material.dart';
import 'package:trips_app/Place/ui/widgets/card_image_list.dart';
import 'package:trips_app/widgets/gradient_back.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GradientBack(
          title: "Bienvenido",
          height: 250.0,
        ),
        CardImageList()
      ],
    );
  }

}
