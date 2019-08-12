import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/User/repository/auth_repository.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();

  /// Flujo de datos - Streams
  /// Stream - Firebase
  /// StreamController FirebaseUser
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;

  /// Retornando el estado de la autenticación
  Stream<FirebaseUser> get authStatus => streamFirebase;

  /// Casos uso
  /// 1. Sign In a la aplicacion
  Future<FirebaseUser> signIn() {
    return _authRepository.signInFirebase();
  }

  @override
  void dispose() {

  }

}
