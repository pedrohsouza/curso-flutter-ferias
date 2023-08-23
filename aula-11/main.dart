import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // FirebaseDatabase.instance.ref().child('usuarios').child('0000').get();

  final UserCredential credential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: 'enzo.santos@icen.ufpa.br',
    password: '123456',
  );

  print(credential.user?.uid);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'wuywuiwiwu',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Minhas Receitas"),
        ),
        body: Center(
          child: Text("Sem receitas ainda."),
        ),
      ),
    );
  }
}
