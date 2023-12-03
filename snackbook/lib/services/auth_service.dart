import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Cadastro com email, senha e campos adicionais
  Future<String?> signUp(String email, String password, String fullName,
      String bio, String phone, String username) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Salvar campos adicionais no banco de dados Firestore ou em outro local desejado
      // Exemplo com Firestore:
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .set({
        'fullName': fullName,
        'phone': phone,
        'username': username,
        'bio': bio,
      });

      return null; // Sucesso
    } catch (e) {
      return e.toString(); // Erro
    }
  }

  // Login com email e senha
  Future<String?> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Sucesso
    } catch (e) {
      return e.toString(); // Erro
    }
  }
}
