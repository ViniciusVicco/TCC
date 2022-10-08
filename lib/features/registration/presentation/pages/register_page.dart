import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/common/widget/custom_email_form_field_widget.dart';
import 'package:tcc/features/registration/presentation/cubit/registration_cubit.dart';

import '../../../../common/widget/custom_password_form_field_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  FocusNode focusNode = FocusNode(canRequestFocus: true);
  final cubit = Modular.get<RegistrationCubit>();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passWordTextEditingController = TextEditingController();
  TextEditingController confirmTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //   focusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<RegistrationCubit, RegistrationState>(
          bloc: cubit,
          builder: (context, state) {
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
                          onPressed: () async {},
                          style: const ButtonStyle(),
                          child: const Text("Cadastrar-se"),
                        )),
                  ),
                  //  const Text("Ou"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
