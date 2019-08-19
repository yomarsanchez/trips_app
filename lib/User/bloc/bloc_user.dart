import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/Place/model/place.dart';
import 'package:trips_app/Place/repository/firebase_storage_repository.dart';
import 'package:trips_app/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:trips_app/User/model/user.dart';
import 'package:trips_app/User/repository/auth_repository.dart';
import 'package:trips_app/User/repository/cloud_firestore_repository.dart';
import 'package:trips_app/User/ui/widgets/profile_place.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  final _firebaseStorageRepository = FirebaseStorageRepository();

  /// Flujo de datos - Streams
  /// Stream - Firebase
  /// StreamController FirebaseUser (sirve para monitorear el estado de la session)
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;

  /// Retornando el estado de la autenticación
  Stream<FirebaseUser> get authStatus => streamFirebase;

  /// Retornando el usuario actual
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  /// CASOS DE USO

  /// 1. Sign In a la aplicacion
  Future<FirebaseUser> signIn() => _authRepository.signInFirebase();

  /// 2. Registrar usuario en base de datos
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  /// Update place data
  Future<void> updatePlaceData(Place place) => _cloudFirestoreRepository.updatePlaceData(place);
  /// Upload Photo Firebase Storage
  Future<StorageUploadTask> uploadFile(String path, File image)  => _firebaseStorageRepository.uploadFile(path, image);
  /// Get List All Places Stream
  Stream<QuerySnapshot> get placesStream => _cloudFirestoreRepository.placesListStream();
  /// Build ALl Places
  List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreRepository.buildPlaces(placesListSnapshot);
  /// Get List Places by User Stream
  Stream<QuerySnapshot> myPlacesStream(String uid) => _cloudFirestoreRepository.myPlacesListStream(uid);
  /// Build Places User
  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreRepository.buildMyPlaces(placesListSnapshot);

  /// Sign Out de la aplicación
  signOut() => _authRepository.signOutFirebase();

  @override
  void dispose() {

  }

}
