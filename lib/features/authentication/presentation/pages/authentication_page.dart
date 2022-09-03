import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tcc/features/authentication/presentation/cubit/authentication_cubit.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
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
                                      child: const Text("Login"),
                                      style: ButtonStyle(),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12)),
                            child: TextFormField(
                                controller: emailTextController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.email)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12)),
                            child: TextFormField(
                                controller: passwordTextController,
                                obscureText: hidePassword,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      icon: Icon(hidePassword
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        changePasswordVisibility();
                                      },
                                    )))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () async {
                                await cubit.login(
                                    email: emailTextController.text,
                                    password: passwordTextController.text);
                              },
                              child: const Text("Login"),
                              style: ButtonStyle(),
                            )),
                      )
                    ],
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
