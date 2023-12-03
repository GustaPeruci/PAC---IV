import 'package:flutter/material.dart';
import 'package:snackbook/colors.dart';

// Importações dos diferentes arquivos das páginas do aplicativo
import 'home.dart';
import 'login.dart';
import 'signup.dart';
import 'profile.dart';
import 'editProfile.dart';
import 'recipe.dart';
import 'settings.dart';

// Definição do tema global do aplicativo
ThemeData myTheme = ThemeData(
  // Configuração para usar o Material 3 (Material You)
  useMaterial3: true,
  // Definição da fonte padrão para o aplicativo
  fontFamily: 'Tajawal',
  // Configurações para temas de campos de entrada de texto
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: kSbGreen900),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kSbGreen900),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kSbGreen400),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
  // Configurações para o tema de botões elevados
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 8.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      primary: kSbGreen900,
    ),
  ),
);

// Classe principal do aplicativo Flutter
class SnackBookApp extends StatelessWidget {
  const SnackBookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Configuração para remover o banner de debug no canto superior direito
      debugShowCheckedModeBanner: false,
      // Título do aplicativo
      title: 'SnackBook',
      // Rota inicial do aplicativo (página de login)
      initialRoute: '/login',
      // Definição das rotas do aplicativo com suas respectivas páginas
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/signup': (BuildContext context) => const SignupPage(),
        '/profile': (BuildContext context) => const ProfilePage(),
        '/editProfile': (BuildContext context) => const EditProfilePage(),
        '/': (BuildContext context) => const HomePage(),
        '/recipe': (BuildContext context) => const RecipePage(
              receita: {},
              docID: '',
            ),
        '/settings': (BuildContext context) => const SettingsPage(),
      },
      // Aplicação do tema global ao MaterialApp
      theme: myTheme,
    );
  }
}
