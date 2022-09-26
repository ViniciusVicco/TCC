import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/failure/abstract_failure.dart';

abstract class RegisterRepositoryAbstract {
  Future<Either<Failure, AuthCredential>> signInWithEmailAndPassword(
      {required String email, required String password});
}
