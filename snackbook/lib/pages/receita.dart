import 'package:flutter/material.dart';
import '../colors.dart';

class Receita extends StatelessWidget {
  const Receita({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Filé à parmegiana'),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset(
            'assets/receitas/fileparmegiana.jpg',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Receita por: Pedro Alvez'),
          ),

          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Prato de restaurante preparado em casa tem seu charme: a farinha de rosca caseira deixa o bife mais crocante e o molho de tomate dá um sabor ainda mais especial ao prato.',
            ),
          ),

          // Ingredientes
          ListTile(
            title: Text('Ingredientes'),
            subtitle: Text('4 bifes de filé mignon\n2 ovos\nFarinha de rosca\n1 xícara de farinha de trigo\n1 pitada de sal\n1 lata de extrato de tomate\n8 fatias de mussarela'),
          ),

          // Instruções
          ListTile(
            title: Text('Instruções'),
            subtitle: Text('Tempere os bifes e os passe na farinha de trigo.\nBata ligeiramente os ovos com uma pitadinha de sal e passe os bifes nessa mistura.\nPasse os bifes na farinha de rosca.\nFrite os bifes e coloque-os em uma forma refratária.\nFaça um molho com extrato de tomate e coloque sobre os filés. Cubra-os com as fatias de mussarela e coloque no forno por aproximadamente 10 minutos.'),
          ),

          ElevatedButton(
            onPressed: () {
              // TO DO a lógica para curtir a receita aqui.
            },
            child: Text('Curtir'),
          ),

          ElevatedButton(
            onPressed: () {
              // TO DO a lógica para comentar sobre a receita aqui.
            },
            child: Text('Comentar'),
          ),
        ],
      ),
    );
  }
}
