import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/failure/abstract_failure.dart';

abstract class RegistrationRepositoryAbstract {
  Future<Either<Failure, UserCredential>> createAccountWithEmailAndPassword(
      {required String email, required String password});
}
