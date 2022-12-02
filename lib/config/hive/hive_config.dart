import 'package:hive_flutter/adapters.dart';

class HiveConfig {
  Future<void> initHive() async {
    await Hive.initFlutter();
  }
}
