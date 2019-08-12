import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> signIn() async {
    /// Solicitando view login
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      /// Obteneindo credenciales
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      /// Preparando credenciales de autenticación
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;

      return user != null ? user : null;
    }

    return null;
  }

  signOut() async {
    await _auth.signOut()
      .then((onValue) {
        print("Session cerrada de Firebase");
      });

    _googleSignIn.signOut()
      .then((onValue) {
        print("Session cerrada de Gogle");
      });
  }

}
