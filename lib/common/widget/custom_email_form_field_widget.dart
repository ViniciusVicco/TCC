import 'package:flutter/material.dart';

class CustomEmailFormFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  const CustomEmailFormFieldWidget(
      {Key? key, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
        child: TextFormField(
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
                hintText: "E-mail",
                errorStyle: TextStyle(wordSpacing: 2),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.email))),
      ),
    );
  }
}
