import 'package:firebase_auth/firebase_auth.dart';
import 'package:trips_app/User/repository/firebase_auth_api.dart';

class AuthRepository {
  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<FirebaseUser> signInFirebase() => _firebaseAuthAPI.signIn();

  signOutFirebase() => _firebaseAuthAPI.signOut();

}
