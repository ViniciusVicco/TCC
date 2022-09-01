import 'package:firebase_core/firebase_core.dart';

class FirebaseConfig {
  Future<void> initFirebase() async {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB6nmJtuD5g2AtBARUm_TePeH4IwGPrfLA",
          appId: "1:14627663713:android:d5dafbd44974bde4535f20",
          messagingSenderId: "14627663713",
          projectId: "cleanarch-76068"),
    );
  }
}
