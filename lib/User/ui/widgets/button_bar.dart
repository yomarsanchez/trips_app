import 'dart:io';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/Place/ui/screens/add_place_screen.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.0,
        vertical: 10.0
      ),
      child: Row(
        children: <Widget>[
          /// Cambiar la contraseña
          CircleButton(
            icon: Icons.vpn_key,
            color: Color.fromRGBO(255, 255, 255, 0.6),
            iconSize: 20.0,
            onPressed: () {},
            isMiniIcon: true
          ),
          CircleButton(
            icon: Icons.card_travel,
            color: Color.fromRGBO(255, 255, 255, 0.6),
            iconSize: 20.0,
            onPressed: () {},
            isMiniIcon: true
          ),
          /// Añadir un nuevo lugar
          CircleButton(
            icon: Icons.add,
            color: Color.fromRGBO(255, 255, 255, 1),
            iconSize: 40.0,
            onPressed: () {
              File image;
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) => AddPlaceScreen( image: image ),
              ));
            },
          ),
          CircleButton(
            icon: Icons.mail_outline,
            color: Color.fromRGBO(255, 255, 255, 0.6),
            iconSize: 20.0,
            onPressed: () {},
            isMiniIcon: true
          ),
          /// Cerrar Session
          CircleButton(
            icon: Icons.exit_to_app,
            color: Color.fromRGBO(255, 255, 255, 0.6),
            iconSize: 20.0,
            onPressed: () {
              userBloc.signOut();
            },
            isMiniIcon: true
          ),
        ],
      )
    );
  }

}
