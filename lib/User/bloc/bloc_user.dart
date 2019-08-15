import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/Place/model/place.dart';
import 'package:trips_app/User/model/user.dart';
import 'package:trips_app/User/repository/auth_repository.dart';
import 'package:trips_app/User/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();
  final _cloudFirestoreRepository = CloudFirestoreRepository();

  /// Flujo de datos - Streams
  /// Stream - Firebase
  /// StreamController FirebaseUser (sirve para monitorear el estado de la session)
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;

  /// Retornando el estado de la autenticación
  Stream<FirebaseUser> get authStatus => streamFirebase;

  /// CASOS DE USO

  /// 1. Sign In a la aplicacion
  Future<FirebaseUser> signIn() => _authRepository.signInFirebase();

  /// 2. Registrar usuario en base de datos
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);

  /// Update place data
  Future<void> updatePlaceData(Place place) => _cloudFirestoreRepository.updatePlaceData(place);

  /// Sign Out de la aplicación
  signOut() => _authRepository.signOutFirebase();

  @override
  void dispose() {

  }

}
