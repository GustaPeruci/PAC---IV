import 'package:flutter/material.dart';
import '../colors.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        backgroundColor: kSbGreen900,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Notificações'),
            trailing: Switch(
              value: false, // TO DO a lógica para controlar as notificações.
              onChanged: (value) {
                // TO DO a lógica para ativar/desativar notificações.
              },
            ),
          ),
          ListTile(
            title: Text('Idioma'),
            trailing: Icon(Icons.arrow_forward), // TO DO a lógica para escolher o idioma.
            onTap: () {
              // TO DO navegação para a tela de seleção de idioma.
            },
          ),
          ListTile(
            title: Text('Tema'),
            trailing: Icon(Icons.arrow_forward), // TO DO a lógica para escolher o tema.
            onTap: () {
              // TO DO navegação para a tela de seleção de tema.
            },
          ),
        ],
      ),
    );
  }
}
