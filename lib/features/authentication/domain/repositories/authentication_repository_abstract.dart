import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc/core/failure/abstract_failure.dart';
import 'package:tcc/features/authentication/domain/failures/login_with_email_and_password_failure.dart';

abstract class AuthenTicationRepositoryAbstract {
  Future<Either<LoginWithEmailAndPasswordFailure, UserCredential>>
      loginWithEmailAndPassword(
          {required String email, required String password});
}
