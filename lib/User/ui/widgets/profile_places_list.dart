import 'package:flutter/material.dart';
import 'package:trips_app/Place/model/place.dart';
import 'profile_place.dart';

class ProfilePlacesList extends StatelessWidget {

  Place place = Place(
    name: 'Knuckles Mountains Range',
    description: 'Hiking. Water fall hunting. Natural bath',
    type: 'Scenery & Photography',
    image: 'https://images.unsplash.com/photo-1473603477862-9d352d4615e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80',
    likes: 3
  );

  Place place2 = Place(
    name: 'Mountains',
    description: 'Hiking. Water fall hunting. Natural bath',
    type: 'Scenery & Photography',
    image: 'https://images.unsplash.com/photo-1531065208531-4036c0dba3ca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
    likes: 10
  );

  Place place3 = new Place(
    name: 'Knuckles',
    description: 'Hiking. Water fall hunting. Natural bath',
    type: 'Scenery & Photography',
    image: 'https://images.unsplash.com/photo-1563373336-e8dd1e084c68?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=80',
    likes: 13
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10.0,
        left: 20.0,
        right: 20.0,
        bottom: 10.0
      ),
      child: Column(
        children: <Widget>[
          ProfilePlace(place),
          ProfilePlace(place2),
          ProfilePlace(place3),
        ],
      ),
    );
  }

}
