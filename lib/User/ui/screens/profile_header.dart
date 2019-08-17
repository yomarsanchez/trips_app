import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/User/model/user.dart';
import 'package:trips_app/User/ui/widgets/button_bar.dart';
import 'package:trips_app/User/ui/widgets/user_info.dart';

class ProfileHeader extends StatelessWidget {
  UserBloc userBloc;
  User user;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return CircularProgressIndicator(backgroundColor: Colors.white);
          case ConnectionState.active:
          case ConnectionState.done:
            return showProfiledata(snapshot);
        }
      },
    );

  }

  Widget showProfiledata(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      /// Login Error
      return Container(
        margin: EdgeInsets.only(
          top: 100.0,
          left: 20.0,
          right: 20.0,
        ),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text(
              "No se pudo cargar información. Haz login",
              style: TextStyle(
                color: Colors.black38,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                fontFamily: "Lato"
              ),
            ),
          ],
        ),
      );
    } else {
      /// Login Success
      print('Login Success');
      print(snapshot.data);

      final title = Text(
        'Profile',
        style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato'
        ),
      );

      /// User Information
      user = User(
        uid: snapshot.data.uid,
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoURL: snapshot.data.photoUrl
      );

      return Container(
        margin: EdgeInsets.only(
          top: 50.0,
          left: 20.0,
          right: 20.0
        ),
        child: Column(
          children: <Widget> [
            Row(
              children: <Widget>[
                title
              ],
            ),
            UserInfo(user: user),
            ButtonsBar(),
          ],
        ),
      );
    }

  }
}
