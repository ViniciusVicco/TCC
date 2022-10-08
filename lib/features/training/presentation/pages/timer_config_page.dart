import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TimerConfigPage extends StatefulWidget {
  const TimerConfigPage({Key? key}) : super(key: key);

  @override
  State<TimerConfigPage> createState() => _TimerConfigPageState();
}

class _TimerConfigPageState extends State<TimerConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Config of Timer")),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed('/');
              },
              child: Text("GoTo Auth"))
        ],
      ),
    );
  }
}
