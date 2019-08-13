import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/User/model/user.dart';
import 'package:trips_app/platzi_trips_cupertino.dart';
import 'package:trips_app/widgets/button_green.dart';
import 'package:trips_app/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget {
  final String title = "Welcome.\nThis is your Travel App";

  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  UserBloc userBloc;
  double screenWidth;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    screenWidth = MediaQuery.of(context).size.width;
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        /// @var snapshot - contiene Object User
        /// Validando el estado de session
        if (!snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          return PlatziTripsCupertino();
        }
      },
    );
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(
            height: null,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Container(
                  width: this.screenWidth,
                  margin: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0
                  ),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 37.0,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              ButtonGreen(
                text: "Login width Gmail",
                onPressed: () {
                  userBloc.signOut();
                  userBloc.signIn()
                  .then((FirebaseUser user) {
                    /// LOGIN RESPONSE
                    /// Updating user data
                    userBloc.updateUserData(User(
                      uid: user.uid,
                      name: user.displayName,
                      email: user.email,
                      photoURL: user.photoUrl
                    ));
                  });
                },
                width: 300.0,
                height: 50.0,
              )
            ],
          ),
        ],
      ),
    );
  }

}
