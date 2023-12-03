import 'package:flutter/material.dart';
import 'package:snackbook/colors.dart';
import '../services/auth_service.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Controladores para obter os valores dos campos de texto
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Função para cadastrar um novo usuário
  Future<void> _signUp() async {
    String fullName = _fullNameController.text.trim();
    String email = _emailController.text.trim();
    String phone = _phoneController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    String bio = "";

    // Verificar se todos os campos estão preenchidos
    if (fullName.isEmpty || phone.isEmpty || username.isEmpty) {
      // Exibir mensagem de erro se algum campo estiver vazio
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Preencha todos os campos.'),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    // Implemente a lógica de cadastro aqui
    AuthService authService = AuthService();
    String? signUpResult = await authService.signUp(
      email,
      password,
      fullName,
      phone,
      username,
      bio,
    );

    if (signUpResult == null) {
      Navigator.of(context).pushReplacementNamed('/');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro no cadastro: $signUpResult'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

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
                  controller: _fullNameController,
                  decoration: InputDecoration(labelText: 'Nome Completo'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Celular'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'Nome de Usuário'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Senha'),
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
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: _signUp, // Chama a função de cadastro
                      child: const Text(
                        'Criar Conta',
                        style: TextStyle(color: kSbGreen50),
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
