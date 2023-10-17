import 'package:flutter/material.dart';

import 'pages/app.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';



Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(appId: "1:979873319160:android:a1da9258e62c964464d30d", messagingSenderId: "979873319160", projectId: "snackbook-9787f", apiKey: '')
  );

  FirebaseFirestore.instance.collection('usuarios').doc('alunos').set({'Nome': 'Tassiana', 'Sobrenome': 'Kautzmann'});

  runApp(const SnackBookApp());

}