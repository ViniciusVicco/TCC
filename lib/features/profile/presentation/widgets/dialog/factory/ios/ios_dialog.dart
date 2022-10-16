import 'package:flutter/cupertino.dart';
import 'package:tcc/features/profile/presentation/widgets/dialog/factory/Idialog.dart';
import 'package:tcc/features/profile/presentation/widgets/dialog/factory/dialog_action.dart';

class IosDialog implements IDialog {
  @override
  Widget create(
      {required BuildContext context,
      required Widget tittle,
      required Widget content,
      required List<DialogAction> actions}) {
    return CupertinoAlertDialog(
      title: tittle,
      content: content,
      actions: actions.map((action) {
        return CupertinoButton(
            child: action.child, onPressed: action.onPressed);
      }).toList(),
    );
  }
}
