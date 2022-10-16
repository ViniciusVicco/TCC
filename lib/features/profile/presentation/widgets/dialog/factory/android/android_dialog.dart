import 'package:flutter/material.dart';
import 'package:tcc/features/profile/presentation/widgets/dialog/factory/dialog_action.dart';

import '../Idialog.dart';

class AndroidDialog implements IDialog {
  @override
  Widget create(
      {required BuildContext context,
      required Widget tittle,
      required Widget content,
      required List<DialogAction> actions}) {
    return AlertDialog(
      title: tittle,
      content: content,
      actions: actions.map((action) {
        return TextButton(
          child: action.child,
          onPressed: action.onPressed,
        );
      }).toList(),
    );
  }
}
