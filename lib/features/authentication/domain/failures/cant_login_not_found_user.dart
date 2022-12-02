import 'package:tcc/core/failure/abstract_failure.dart';

class CantLoginByNotFoundUser implements Failure {
  @override
  String get message => "Usuário não encontrado, cadastre-se";
}
