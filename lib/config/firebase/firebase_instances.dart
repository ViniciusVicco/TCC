import 'package:firebase_auth/firebase_auth.dart';

class FirebaseInstances {
  FirebaseInstances(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;
  FirebaseAuth get getFirebaseAuthInstance {
    return _firebaseAuth;
  }
}
