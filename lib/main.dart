import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/User/ui/screens/sign_in_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: 'Trips App',
        debugShowCheckedModeBanner: false,
        // home: PlatziTripsCupertino(),
        home: SignInScreen(),
      ),
      bloc: UserBloc(),
    );
  }
}
