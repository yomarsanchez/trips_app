import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/platzi_trips.dart';
import 'package:trips_app/platzi_trips_cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: 'Trips App',
        debugShowCheckedModeBanner: false,
        home: PlatziTripsCupertino(),
      ),
      bloc: UserBloc(),
    );
  }
}
