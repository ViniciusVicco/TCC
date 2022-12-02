import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc/core/failure/abstract_failure.dart';

abstract class AuthenTicationRepositoryAbstract {
  Future<Either<Failure, UserCredential>> loginWithEmailAndPassword(
      {required String email, required String password});
}
