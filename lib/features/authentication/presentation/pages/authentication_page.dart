import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Authetication")),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed('/training/');
              },
              child: Text("Got To registration"))
        ],
      ),
    );
  }
}
