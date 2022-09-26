import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tcc/core/datasource/datasource_response.dart';
import 'package:tcc/features/registration/data/datasources/registration_datasource_abstract.dart';

class RegistrationDataSourceImpl implements RegistrationDataSourceAbstract {
  final FirebaseAuth firebaseAuth;
  RegistrationDataSourceImpl({required this.firebaseAuth});

  @override
  Future<DataSourceResponse> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    if (await InternetConnectionChecker().hasConnection) {
      final response = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return DataSourceResponse(
          data: response.credential,
          success: response.credential is UserCredential);
    } else {
      return DataSourceResponse(data: null, success: false);
    }
  }
}
