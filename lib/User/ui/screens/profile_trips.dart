import 'package:flutter/material.dart';
import 'package:trips_app/User/ui/screens/profile_header.dart';
import 'package:trips_app/User/ui/widgets/profile_background.dart';
import 'package:trips_app/User/ui/widgets/profile_places_list.dart';

class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[
            ProfileHeader(),
            ProfilePlacesList(),
          ],
        ),
      ],
    );
  }

}
