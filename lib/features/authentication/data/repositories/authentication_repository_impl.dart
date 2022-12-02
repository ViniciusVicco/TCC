import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:tcc/features/authentication/data/datasources/authentication_datasource_abstract.dart';
import 'package:tcc/features/authentication/domain/failures/cant_login_by_user_disabled.dart';
import 'package:tcc/features/authentication/domain/failures/cant_login_not_found_user.dart';
import 'package:tcc/features/authentication/domain/repositories/authentication_repository_abstract.dart';

import '../../../../core/failure/abstract_failure.dart';
import '../../domain/failures/cant_login_reason_email_or_password_invalid.dart';
import '../../domain/failures/cant_login_with_email_and_password_failure.dart';

class AuthenticationRepositoryImpl implements AuthenTicationRepositoryAbstract {
  final AuthenticationDataSourceAbstract authenticationDataSourceAbstract;
  AuthenticationRepositoryImpl(
      {required this.authenticationDataSourceAbstract});
  @override
  Future<Either<Failure, UserCredential>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final loginWithEmailAndPasswordData =
          await authenticationDataSourceAbstract.loginWithEmailAndPassword(
              email: email, password: password);
      if (loginWithEmailAndPasswordData.success) {
        return Right(loginWithEmailAndPasswordData.data as UserCredential);
      } else {
        return Left(CantLoginWithEmailAndPasswordFailure());
      }
    } on FirebaseAuthException catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      if (exception.code == "invalid-email" ||
          exception.code == "wrong-password") {
        return Left(CantLoginReasonEmailOrPasswordInvalid());
      } else if (exception.code == "user-not-found") {
        return Left(CantLoginByNotFoundUser());
      } else if (exception.code == "user-disabled") {
        return Left(CantLoginByUserDisabled());
      } else {
        return Left(CantLoginWithEmailAndPasswordFailure());
      }
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      return Left(CantLoginWithEmailAndPasswordFailure());
    }
  }
}
