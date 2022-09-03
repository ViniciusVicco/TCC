import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tcc/core/datasource/datasource_response.dart';

import '../../domain/datasources/authentication_datasource_abstract.dart';

class AuthenticationDataSourceImpl implements AuthenticationDataSourceAbstract {
  final FirebaseAuth firebaseAuth;
  AuthenticationDataSourceImpl({required this.firebaseAuth});

  @override
  Future<DataSourceResponse> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    if (await InternetConnectionChecker().hasConnection) {
      final userCredentialResponse = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return DataSourceResponse(data: userCredentialResponse, success: true);
    } else {
      return DataSourceResponse(data: null, success: false);
    }
  }
}
