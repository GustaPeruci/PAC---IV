import 'package:flutter/material.dart';
import '../colors.dart';
import 'package:snackbook/services/firestore.dart';

class RecipePage extends StatefulWidget {
  final Map<String, dynamic> receita;
  final String docID;

  const RecipePage({Key? key, required this.receita, required this.docID})
      : super(key: key);

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imagemController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController ingredientesController = TextEditingController();
  final TextEditingController instrucoesController = TextEditingController();

  final FirestoreService firestoreService = FirestoreService();

  void openNoteBox({String? docID, Map<String, dynamic>? data}) {
    if (data != null) {
      nameController.text = data['nome'] ?? '';
      imagemController.text = data['imagem'] ?? '';
      descricaoController.text = data['descricao'] ?? '';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: imagemController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: descricaoController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (docID == null || docID.isEmpty) {
                // Chamar addNote com todos os campos
                firestoreService.addNote(
                  nameController.text,
                  imagemController.text,
                  descricaoController.text,
                  ingredientesController.text.split('\n'),
                  instrucoesController.text.split('\n'),
                );
              } else {
                // Chamar updateNote com todos os campos
                firestoreService.updateNote(
                  docID,
                  nameController.text,
                  imagemController.text,
                  descricaoController.text,
                  ingredientesController.text.split('\n'),
                  instrucoesController.text.split('\n'),
                );
              }

              // Limpar controladores
              nameController.clear();
              imagemController.clear();

              Navigator.pop(context);
            },
            child: Text(
              "Adicionar",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    descricaoController.text = widget.receita['descricao'] ?? '';
    ingredientesController.text =
        (widget.receita['ingredientes'] as List<dynamic>? ?? [])
            .where((ingrediente) => ingrediente.isNotEmpty)
            .map((ingrediente) => '\u2022 $ingrediente')
            .join('\n');
    instrucoesController.text =
        (widget.receita['instrucoes'] as List<dynamic>? ?? [])
            .where((instrucao) => instrucao.isNotEmpty)
            .toList()
            .asMap()
            .entries
            .map((entry) => '${entry.key + 1}. ${entry.value}')
            .join('\n');
  }

  void _saveChanges() async {
    final String descricao = descricaoController.text;
    final List<String> ingredientes =
        ingredientesController.text.split('\n').map((linha) {
      return linha.isNotEmpty
          ? linha.startsWith('\u2022')
              ? linha.substring(2)
              : linha
          : '';
    }).toList();
    final List<String> instrucoes =
        instrucoesController.text.split('\n').map((linha) {
      return linha.isNotEmpty
          ? linha.startsWith(new RegExp(r'\d+\.'))
              ? linha.substring(linha.indexOf('.') + 2)
              : linha
          : '';
    }).toList();

    final String nome = widget.receita['nome'] ?? '';
    final String imagem = widget.receita['imagem'] ?? '';

    await firestoreService.updateNote(
      widget.docID,
      nome,
      imagem,
      descricao,
      ingredientes,
      instrucoes,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String nome = widget.receita['nome'] ?? '';
    final String imagem = widget.receita['imagem'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(nome),
        centerTitle: true,
        backgroundColor: kSbGreen900,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveChanges,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          Stack(
            children: [
              Image.network(
                imagem,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        openNoteBox(docID: widget.docID, data: widget.receita);
                      },
                      icon: const Icon(Icons.settings),
                    ),
                    IconButton(
                      onPressed: () {
                        firestoreService.deleteNote(widget.docID);
                        Navigator.of(context).pushNamed('/');
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: descricaoController,
              decoration: InputDecoration(
                labelText: 'Descrição',
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Ingredientes:',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: ingredientesController,
              maxLines: null,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Instruções:',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: instrucoesController,
              maxLines: null,
            ),
          ),
        ],
      ),
    );
  }
}
