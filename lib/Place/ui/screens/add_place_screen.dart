import 'dart:io';
import 'package:flutter/material.dart';
import 'package:trips_app/widgets/gradient_back.dart';
import 'package:trips_app/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  File image;

  AddPlaceScreen({
    @required this.image
  });

  @override
  State<StatefulWidget> createState() => _AddPlaceScreen();

}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(
            height: screenHeight * 0.40,
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 45.0,
                  left: 5.0
                ),
                child: SizedBox(
                  width: 45.0,
                  height: 45.0,
                  child: IconButton(
                    padding: EdgeInsets.all(0.0),
                    alignment: Alignment.centerRight,
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 45.0,
                    left: 20.0,
                    right: 10.0
                  ),
                  child: TitleHeader(
                    title: "Add a new place"
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}
