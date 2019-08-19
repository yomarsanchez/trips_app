import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';

class CardImageList extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
      height: 250.0,
      margin: EdgeInsets.only(
        top: 80.0,
        left: 0.0
      ),
      child: StreamBuilder(
        stream: userBloc.placesStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Container(
                // color: Colors.black12,
                alignment: FractionalOffset.center,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.deepPurpleAccent,
                ),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
            default:
              return listViewPlaces(userBloc.buildPlaces(snapshot.data.documents));
              break;
          }
        },
      ),
    );
  }

  Widget listViewPlaces(List<CardImageWithFabIcon> cards) {
    return ListView(
      padding: EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: cards,
    );
  }

}
