import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/User/model/user.dart';
import 'package:trips_app/User/ui/screens/profile_header.dart';
import 'package:trips_app/User/ui/widgets/profile_background.dart';
import 'package:trips_app/User/ui/widgets/profile_places_list.dart';

class ProfileTrips extends StatelessWidget {
  UserBloc userBloc;
  double screenHeight;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    screenHeight = MediaQuery.of(context).size.height;

    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return Container(
              color: Colors.black12,
              alignment: FractionalOffset.center,
              child: CircularProgressIndicator(
                backgroundColor: Colors.deepPurpleAccent,
              ),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
          default:
            return showProfileView(snapshot);
            break;
        }
      },
    );
  }

  Widget showProfileView(AsyncSnapshot snapshot) {
    List<Widget> listView = List<Widget>();

    if (snapshot.hasError || !snapshot.hasData) {
      print('Error : Usuario no de encuentra logeado');

      listView.add(Center(
        child: Container(
          margin: EdgeInsets.only(
            top: screenHeight * 0.50
          ),
          child: Text(
            'Usuario necesita logearse...',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Lato"
            ),
          ),
        ),
      ));
    } else {
      print(snapshot.data);
      var user = User(
        uid: snapshot.data.uid,
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoURL: snapshot.data.photoUrl
      );

      listView.add(ProfileHeader(
        user: user,
      ));

      listView.add(ProfilePlacesList(
        user: user,
      ));
    }

    return Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: listView,
        ),
      ],
    );
  }

}
