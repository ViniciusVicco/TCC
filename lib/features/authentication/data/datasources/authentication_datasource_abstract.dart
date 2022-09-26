import '../../../../core/datasource/datasource_response.dart';

abstract class AuthenticationDataSourceAbstract {
  Future<DataSourceResponse> loginWithEmailAndPassword(
      {required String email, required String password});
}
