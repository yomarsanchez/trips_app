import 'dart:io';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trips_app/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:trips_app/Place/ui/widgets/text_input_location.dart';
import 'package:trips_app/widgets/gradient_back.dart';
import 'package:trips_app/widgets/text_input.dart';
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
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();
    final _controllerLocationPlace = TextEditingController();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(
            height: screenHeight * 0.35,
          ),
          /// App Bar
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
          ),
          /// List View Body
          Container(
            margin: EdgeInsets.only(
              top: 120.0,
              bottom: 20.0
            ),
            child: ListView(
              children: <Widget>[
                /// Photo
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                    bottom: 30.0
                  ),
                  child: CardImageWithFabIcon(
                    // image: widget.image.path,
                    image: "assets/img/img-1.jpg",
                    height: 220,
                    width: MediaQuery.of(context).size.width - 80.0,
                    icon: Icons.camera_alt,
                    isMiniIcon: false,
                    onPressedTabIcon: () {},
                    left: 0.0
                  ),
                ),
                /// Input - Title
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: TextInput(
                    placeholder: "Title",
                    type: TextInputType.text,
                    controller: _controllerTitlePlace,
                  ),
                ),
                /// Input - Description
                TextInput(
                  placeholder: "Description",
                  type: TextInputType.multiline,
                  maxLines: 5,
                  controller: _controllerDescriptionPlace,
                ),
                /// Input - Location
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                    placeholder: "Add Location",
                    controller: _controllerLocationPlace,
                    icon: MdiIcons.mapMarkerOutline,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}
