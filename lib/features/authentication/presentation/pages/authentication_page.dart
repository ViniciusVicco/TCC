import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tcc/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:tcc/common/widget/custom_email_form_field_widget.dart';

import '../../../../common/widget/custom_password_form_field_widget.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final cubit = Modular.get<AuthenticationCubit>();
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;
  @override
  void initState() {
    cubit.init();
    passwordTextController = TextEditingController();
    emailTextController = TextEditingController();
    super.initState();
  }

  bool hidePassword = true;

  void changePasswordVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
                bloc: cubit,
                builder: (context, state) {
                  if (state is AuthenticationInProgressState) {
                    return Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Autenticando..."),
                        ),
                        Shimmer(
                          gradient: LinearGradient(
                              colors: [Colors.grey[400]!, Colors.white]),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: TextFormField()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: TextFormField()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: ElevatedButton(
                                      onPressed: () async {},
                                      style: const ButtonStyle(),
                                      child: const Text("Login"),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomEmailFormFieldWidget(
                            textEditingController: emailTextController),
                        CustomPasswordFormFieldWidget(
                          textEditingController: passwordTextController,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 5, 8, 2),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await cubit.login(
                                        email: emailTextController.text,
                                        password: passwordTextController.text);
                                  }
                                },
                                style: const ButtonStyle(),
                                child: const Text("Login"),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 5),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () async {
                                  await cubit.navigateToRegistrerModule();
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.blue)),
                                child: const Text("Cadastrar"),
                              )),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    ));
  }
}
