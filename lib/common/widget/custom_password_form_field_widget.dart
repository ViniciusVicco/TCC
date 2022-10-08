import 'package:flutter/material.dart';

class CustomPasswordFormFieldWidget extends StatefulWidget {
  final String? textHint;
  final TextEditingController textEditingController;
  CustomPasswordFormFieldWidget(
      {Key? key, required this.textEditingController, this.textHint})
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
        child: TextFormField(
            controller: widget.textEditingController,
            obscureText: hidePassword,
            decoration: InputDecoration(
                hintText: widget.textHint ?? "Senha",
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                      hidePassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                ))),
      ),
    );
  }
}
