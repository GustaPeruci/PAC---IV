import 'package:flutter/material.dart';
import 'package:snackbook/colors.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                    labelText: 'Nome Completo',
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
                    labelText: 'Email',
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
                    labelText: 'Celular',
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
                        Navigator.of(context).pushNamed('/login');
                      },
                      child: const Text(
                        'Já Possuo Conta',
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
                      onPressed: () {},
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
                const SizedBox(height: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
