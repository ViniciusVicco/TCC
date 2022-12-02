import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tcc/features/registration/presentation/cubit/registration_cubit.dart';
import 'package:tcc/features/registration/presentation/pages/widgets/registration_main_content_widget.dart';

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
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key("scaffoldKey"),
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            color: Colors.black,
            onPressed: () {
              Modular.to.pop();
            },
          ),
          elevation: 0,
          backgroundColor: Colors.transparent),
      backgroundColor: Colors.white,
      body: BlocBuilder<RegistrationCubit, RegistrationState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is RegistrationInProgressState) {
            return Shimmer(
              gradient:
                  LinearGradient(colors: [Colors.grey[400]!, Colors.white]),
              child: RegistrationMainContentWidget(
                  confirmTextEditingController:
                      confirmPasswordTextEditingController,
                  emailTextEditingController: emailTextEditingController,
                  passWordTextEditingController: passWordTextEditingController,
                  callback: () async {}),
            );
          }

          return Form(
            key: _formKey,
            child: RegistrationMainContentWidget(
                confirmTextEditingController:
                    confirmPasswordTextEditingController,
                emailTextEditingController: emailTextEditingController,
                passWordTextEditingController: passWordTextEditingController,
                callback: () async {
                  if (_formKey.currentState!.validate()) {
                    if (cubit.checkIfPassWordsAreEqual(
                        passWord: passWordTextEditingController.text,
                        confirmPassword:
                            confirmPasswordTextEditingController.text)) {
                      await cubit.accountRegistration(context,
                          email: emailTextEditingController.text,
                          password: passWordTextEditingController.text);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Suas senhas não coincidem")));
                    }
                  }
                }),
          );
        },
      ),
    );
  }
}
