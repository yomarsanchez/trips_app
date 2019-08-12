import 'package:flutter/material.dart';
import 'package:trips_app/platzi_trips.dart';
import 'package:trips_app/platzi_trips_cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: PlatziTripsCupertino(),
    );
  }
}
