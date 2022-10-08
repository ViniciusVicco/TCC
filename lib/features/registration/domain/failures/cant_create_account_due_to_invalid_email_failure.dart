import 'package:tcc/core/failure/abstract_failure.dart';

class CantCreatAccountDueToInvalidEmailFailure implements Failure {
  @override
  // TODO: implement message
  String get message => "E-mail inválido ou não encontrado";
}
