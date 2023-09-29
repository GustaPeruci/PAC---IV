import 'package:flutter/material.dart';
import 'package:snackbook/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/logo/LOGO.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nome de Usuário',
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
                ),
                const SizedBox(height: 12),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Senha',
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
                  obscureText: true,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                      child: const Text(
                        'Entrar',
                        style: TextStyle(color: kSbGreen50),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 8.0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        backgroundColor: kSbGreen900,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: const Text(
                        'Criar Conta',
                        style: TextStyle(color: kSbGreen50),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 8.0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        backgroundColor: kSbGreen900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
