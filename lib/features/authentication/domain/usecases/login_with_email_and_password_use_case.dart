import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc/core/usecase/use_case.dart';
import 'package:tcc/features/authentication/domain/failures/login_with_email_and_password_failure.dart';
import 'package:tcc/features/authentication/domain/repositories/authentication_repository_abstract.dart';

class LoginWithEmailAndPasswordUseCase implements UseCase {
  final AuthenTicationRepositoryAbstract repository;
  LoginWithEmailAndPasswordUseCase(
      {required this.repository});

  Future<Either<LoginWithEmailAndPasswordFailure, UserCredential>>
      loginWithEmailAndPassword(
          {required String email, required String password}) {
    return repository.loginWithEmailAndPassword(
        email: email, password: password);
  }
}
