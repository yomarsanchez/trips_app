import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/User/model/user.dart';

class ProfilePlacesList extends StatelessWidget {
  UserBloc userBloc;
  User user;

  ProfilePlacesList({
    @required this.user
  });

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
      margin: EdgeInsets.only(
        top: 10.0,
        left: 20.0,
        right: 20.0,
        bottom: 10.0
      ),
      child: StreamBuilder(
        stream: userBloc.myPlacesStream(user.uid),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Container(
                alignment: FractionalOffset.center,
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
            default:
              return Column(
                children: userBloc.buildMyPlaces(snapshot.data.documents)
              );
              break;
          }
        },
      )
    );
  }

}
