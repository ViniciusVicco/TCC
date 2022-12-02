import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseInstances {
  FirebaseInstances(
      this._firebaseAuth, this._firebaseFirestore, this._firebaseDatabase);
  final FirebaseStorage _firebaseDatabase;
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  FirebaseAuth get getFirebaseAuthInstance {
    return _firebaseAuth;
  }

  FirebaseFirestore get getFirebaseFireStoreInstance {
    return _firebaseFirestore;
  }

  FirebaseStorage get getFirebaseStorageInstance {
    return _firebaseDatabase;
  }
}
