import 'package:flutter/cupertino.dart';

import 'dialog_action.dart';

abstract class IDialog {
  Widget create(
      {required BuildContext context,
      required Widget tittle,
      required Widget content,
      required List<DialogAction> actions});
}
