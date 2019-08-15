import 'package:flutter/material.dart';
import 'package:trips_app/Place/ui/widgets/card_image_list.dart';
import 'package:trips_app/widgets/gradient_back.dart';
import 'package:trips_app/widgets/title_header.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GradientBack(
          height: 250.0,
        ),
        /// Tittle Header
        Row(
          children: <Widget>[
            Flexible(
              child: Container(
                padding: EdgeInsets.only(
                  top: 45.0,
                  left: 20.0,
                  right: 20.0
                ),
                child: TitleHeader(
                  title: "Popular",
                  fontSize: 34.0
                ),
              ),
            )
          ],
        ),
        CardImageList()
      ],
    );
  }

}
