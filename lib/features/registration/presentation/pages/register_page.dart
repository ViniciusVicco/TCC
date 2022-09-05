import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/features/registration/presentation/cubit/registration_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final cubit = Modular.get<RegistrationCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RegistrationCubit, RegistrationState>(
        bloc: cubit,
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {},
                  child: const Text("Cadastrar"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
