import 'package:tcc/core/failure/abstract_failure.dart';

class CantLoginReasonEmailOrPasswordInvalid implements Failure {
  @override
  String get message => "Verifique se seu e-mail ou senha estão corretos";
}
