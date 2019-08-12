import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/platzi_trips_cupertino.dart';
import 'package:trips_app/widgets/button_green.dart';
import 'package:trips_app/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  String title = "Welcome.\nThis is your Travel App";
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    print('--- authStatus ---');
    print(userBloc.authStatus);
    print('--- authStatus ---');
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
            title: "",
            height: null,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                this.title,
                style: TextStyle(
                  fontSize: 37.0,
                  fontFamily: "Lato",
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              ButtonGreen(
                text: "Login width Gmail",
                onPressed: () {
                  userBloc.signIn()
                  .then((FirebaseUser user) {
                    print('--LOGIN RESPONSE--');
                    print(user);
                    print('--LOGIN RESPONSE--');
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
