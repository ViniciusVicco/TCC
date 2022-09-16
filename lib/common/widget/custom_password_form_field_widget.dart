import 'package:flutter/material.dart';

class CustomPasswordFormFieldWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  CustomPasswordFormFieldWidget({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  State<CustomPasswordFormFieldWidget> createState() =>
      _CustomPasswordFormFieldWidgetState();
}

class _CustomPasswordFormFieldWidgetState
    extends State<CustomPasswordFormFieldWidget> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.textEditingController,
        obscureText: hidePassword,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon:
                  Icon(hidePassword ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
            )));
  }
}
