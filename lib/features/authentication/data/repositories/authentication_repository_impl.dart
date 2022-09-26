import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:tcc/features/authentication/data/datasources/authentication_datasource_abstract.dart';
import 'package:tcc/features/authentication/domain/repositories/authentication_repository_abstract.dart';

import '../../domain/failures/login_with_email_and_password_failure.dart';

class AuthenticationRepositoryImpl implements AuthenTicationRepositoryAbstract {
  final AuthenticationDataSourceAbstract authenticationDataSourceAbstract;
  AuthenticationRepositoryImpl(
      {required final this.authenticationDataSourceAbstract});
  @override
  Future<Either<LoginWithEmailAndPasswordFailure, UserCredential>>
      loginWithEmailAndPassword(
          {required String email, required String password}) async {
    try {
      final loginWithEmailAndPasswordData =
          await authenticationDataSourceAbstract.loginWithEmailAndPassword(
              email: email, password: password);
      if (loginWithEmailAndPasswordData.success) {
        return Right(loginWithEmailAndPasswordData.data as UserCredential);
      } else {
        return Left(LoginWithEmailAndPasswordFailure());
      }
    } catch (error) {
      return Left(LoginWithEmailAndPasswordFailure());
    }
  }
}
