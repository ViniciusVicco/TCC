import 'package:tcc/core/failure/abstract_failure.dart';

class CantGetProfileFileUrlFailure implements Failure {
  @override
  String get message => "Ocorreu um erro ao tentar obter sua foto de perfil";
}
