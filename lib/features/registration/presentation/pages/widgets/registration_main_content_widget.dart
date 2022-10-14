import 'package:flutter/material.dart';

import '../../../../../common/presentation/textfields/widgets/custom_email_form_field_widget.dart';
import '../../../../../common/presentation/textfields/widgets/custom_password_form_field_widget.dart';

class RegistrationMainContentWidget extends StatelessWidget {
  final TextEditingController confirmTextEditingController;
  final TextEditingController emailTextEditingController;
  final TextEditingController passWordTextEditingController;
  final void Function() callback;
  const RegistrationMainContentWidget(
      {super.key,
      required this.confirmTextEditingController,
      required this.emailTextEditingController,
      required this.passWordTextEditingController,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomEmailFormFieldWidget(
              textEditingController: emailTextEditingController),
          CustomPasswordFormFieldWidget(
              textEditingController: passWordTextEditingController),
          CustomPasswordFormFieldWidget(
              textEditingController: confirmTextEditingController,
              textHint: "Confirme sua senha"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: callback,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  child: const Text("Cadastrar-se"),
                )),
          ),
        ],
      ),
    );
  }
}
