import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trips_app/Place/model/place.dart';
import 'package:trips_app/User/model/user.dart';

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
      'userOwner': "${USERS.toString()}/${uid.toString()}",
      'urlImage': place.urlImage
    });

  }
}
