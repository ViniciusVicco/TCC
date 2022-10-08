import 'package:tcc/core/datasource/datasource_response.dart';

abstract class RegistrationDataSourceAbstract {
  Future<DataSourceResponse> createAccountWithEmailAndPassword(
      {required String email, required String password});
}
