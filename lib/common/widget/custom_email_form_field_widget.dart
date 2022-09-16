import 'package:flutter/material.dart';

class CustomEmailFormFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  const CustomEmailFormFieldWidget(
      {Key? key, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: 1,
        validator: (emailText) {
          if (!emailText!.contains("@") || !emailText.contains(".com")) {
            return "E-mail inválido";
          }
          return null;
        },
        enableIMEPersonalizedLearning: true,
        controller: textEditingController,
        decoration: const InputDecoration(
            errorStyle: TextStyle(wordSpacing: 2),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.email)));
  }
}
