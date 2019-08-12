
import 'package:trips_app/User/model/user.dart';
import 'package:trips_app/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);
}
