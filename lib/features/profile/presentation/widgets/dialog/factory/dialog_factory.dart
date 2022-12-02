import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tcc/features/profile/presentation/widgets/dialog/factory/Idialog.dart';
import 'package:tcc/features/profile/presentation/widgets/dialog/factory/android/android_dialog.dart';
import 'package:tcc/features/profile/presentation/widgets/dialog/factory/ios/ios_dialog.dart';

import 'dialog_action.dart';

class DialogFactory {
  static Future showAlertDialog<T>(BuildContext context,
      {required Widget tittle,
      required Widget content,
      required List<DialogAction> actions}) {
    IDialog dialogData;

    if (Platform.isIOS) {
      dialogData = IosDialog();
    } else {
      dialogData = AndroidDialog();
    }
    return showDialog(
        context: context,
        builder: (context) => dialogData.create(
            context: context,
            tittle: tittle,
            content: content,
            actions: actions));
  }
}
