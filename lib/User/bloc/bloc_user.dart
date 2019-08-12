import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/User/model/user.dart';
import 'package:trips_app/User/repository/auth_repository.dart';
import 'package:trips_app/User/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();

  /// Flujo de datos - Streams
  /// Stream - Firebase
  /// StreamController FirebaseUser (sirve para monitorear el estado de la session)
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;

  /// Retornando el estado de la autenticación
  Stream<FirebaseUser> get authStatus => streamFirebase;

  /// Casos uso

  /// 1. Sign In a la aplicacion
  Future<FirebaseUser> signIn() {
    return _authRepository.signInFirebase();
  }

  /// 2. Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();

  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);

  /// Sign Out de la aplicacion
  signOut() {
    _authRepository.signOutFirebase();
  }

  @override
  void dispose() {

  }

}
