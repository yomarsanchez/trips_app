import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trips_app/Place/model/place.dart';
import 'package:trips_app/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:trips_app/User/model/user.dart';
import 'package:trips_app/User/ui/widgets/profile_place.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String PLACES = "places";

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);

    return await ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL' : user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, merge: true);
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);

    String uid = (await _auth.currentUser()).uid;

    await refPlaces.add({
      'name': place.name,
      'description': place.description,
      'type': place.type,
      'likes': place.likes,
      'urlImage': place.urlImage,
      'userOwner': _db.document("${USERS.toString()}/${uid.toString()}")
    })
      .then((DocumentReference dr) {
        dr.get()
          .then((DocumentSnapshot snapshot) {
            /// PLace Referencia Array to User
            DocumentReference userRef = _db.collection(USERS).document(uid);
            userRef.updateData({
              'myPlaces': FieldValue.arrayUnion([
                _db.document("${PLACES.toString()}/${snapshot.documentID}")
              ])
            });
          });
      })
      .catchError((onError) {
        print("Error : no se puedo agregar un nuevo lugar.");
        print(onError);
      });
  }

  Stream<QuerySnapshot> placesListStream() => _db.collection(PLACES).snapshots();

  List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<CardImageWithFabIcon> swiper = List<CardImageWithFabIcon>();
    double height = 250.0;
    double width = 250.0;
    IconData icon = Icons.favorite_border;
    double separator = 20.0;

    placesListSnapshot.forEach((response) {
      swiper.add(CardImageWithFabIcon(
        image: response.data['urlImage'],
        height: height,
        width: width,
        icon: icon,
        onPressedTabIcon : () {},
        left: separator
      ));
    });

    return swiper;
  }

  Stream<QuerySnapshot> myPlacesListStream(String uid) => _db.collection(PLACES).where("userOwner", isEqualTo: _db.document("${USERS.toString()}/${uid.toString()}")).snapshots();

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<ProfilePlace> profilePlaces = List<ProfilePlace>();
    placesListSnapshot.forEach((response) {
      profilePlaces.add(ProfilePlace(
        place: Place(
          name: response.data['name'],
          description: response.data['description'],
          type: response.data['type'],
          urlImage: response.data['urlImage'],
          likes: response.data['likes']
        )
      ));
    });

    return profilePlaces;
  }

}
