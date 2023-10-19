import 'package:flutter/material.dart';
import '../colors.dart';

class RecipesInfosPage extends StatefulWidget {
  const RecipesInfosPage({Key? key}) : super(key: key);

  @override
  _RecipesInfosPageState createState() => _RecipesInfosPageState();
}

class _RecipesInfosPageState extends State<RecipesInfosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Filé à parmegiana'),
        centerTitle: true,
        backgroundColor: kSbGreen900,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          Stack(
            children: [
              Image.asset(
                'assets/receitas/fileparmegiana.jpg',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Autor: Pedro'),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'A receita de filé à parmegiana é um prato clássico e saboroso. O filé à parmegiana é servido quente, acompanhado de arroz branco, batatas fritas ou salada, conforme a preferência..',
            ),
          ),
          ListTile(
            title: Text('Ingredientes'),
            subtitle: Text(
                '- 500 g de alcatra ou contra filé em bifes\n- Alho\n- 2 Dentes de alho amassados\n- Orégano seco\n- Orégano\n- Sal\n- Sal a gosto\n- Vinagre\n- Vinagre a gosto\n- Ovo\n- 2 ovos batidos com 1 pitada de sal\n- Farinha de rosca\n- Farinha de rosca, o suficiente\n- Molho de tomate\n- 1/2 litro de molho de tomate pronto\n- Queijo mussarela\n- 250 g de mussarela em fatias\n- Queijo parmesão ralado\n- Queijo parmesão ralado para polvilhar\n- Pimenta-do-reino\n- Pimenta-do-reino a gosto'),
          ),
          ListTile(
            title: Text('Instruções'),
            subtitle: Text(
                '1 Tempere os filés com o alho, orégano, sal, pimenta e vinagre.\n2 Passe pela farinha de rosca, nos ovos batidos e novamente pela farinha de rosca.\n3 Frite em óleo quente.\n4 Escorra sobre papel absorvente.\n5 Acomode os filés em um refratário regado com um pouco de molho.\n6 Coloque fatias de mussarela sobre os filés.\n7 Regue com o molho.\n8 Polvilhe o queijo parmesão ralado.\n9 Leve ao forno pré-aquecido para derreter a mussarela.\n10 Sirva com arroz ou purê e uma salada.'),
          ),
          Container(
            height: 60,
            width: 60,
            child: const TextField(
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Comentário',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
