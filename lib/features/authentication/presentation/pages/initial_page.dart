import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Modular.to.pushReplacementNamed(
        "/authpage",
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: LottieBuilder.asset(
              "assets/lotties/landing_page_animation.json")),
    );
  }
}
