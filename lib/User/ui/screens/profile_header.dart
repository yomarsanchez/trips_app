import 'package:flutter/material.dart';
import 'package:trips_app/User/model/user.dart';
import 'package:trips_app/User/ui/widgets/button_bar.dart';
import 'package:trips_app/User/ui/widgets/user_info.dart';

class ProfileHeader extends StatelessWidget {
  User user;

  ProfileHeader({
    @required this.user
  });

  @override
  Widget build(BuildContext context) => showProfileData();

  Widget showProfileData() {
    final title = Text(
      'Profile',
      style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'
      ),
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
