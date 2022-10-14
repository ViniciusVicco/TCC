import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseInstances {
  FirebaseInstances(
      this._firebaseAuth, this._firebaseFirestore, this._firebaseDatabase);
  final FirebaseDatabase _firebaseDatabase;
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  FirebaseAuth get getFirebaseAuthInstance {
    return _firebaseAuth;
  }

  FirebaseFirestore get getFirebaseFireStoreInstance {
    return _firebaseFirestore;
  }

  FirebaseDatabase get getFirebaseDatabaseInstance {
    return _firebaseDatabase;
  }
}
