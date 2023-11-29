import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:snackbook/services/firestore.dart';
import '../colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // firestore
  final FirestoreService firestoreService = FirestoreService();

  // text controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imagemController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();

  // open a dialog vox to add a note
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
                firestoreService.addNote(
                  nameController.text,
                  imagemController.text,
                  descricaoController.text,
                );
              } else {
                firestoreService.updateNote(
                  docID,
                  nameController.text,
                  imagemController.text,
                  descricaoController.text,
                );
              }

              nameController.clear();
              imagemController.clear();
              descricaoController.clear();

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snackbook'),
        centerTitle: true,
        backgroundColor: kSbGreen900,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).pushNamed('/profile');
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          // if have data, get all the docs
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;

            // display as a list
            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = notesList[index];
                String docID = document.id;
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String nome = data['nome'];
                String imagem = data['imagem'];
                String descricao = data['descricao'];

                return Card(
                  elevation: 2.0,
                  margin: EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/recipesInfos');
                            },
                            child: Image.network(
                              imagem, // Use a imagem do Firestore (você pode precisar ajustar isso)
                              width: double.infinity,
                              height: 400.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () =>
                                      openNoteBox(docID: docID, data: data),
                                  icon: const Icon(Icons.settings),
                                ),
                                IconButton(
                                  onPressed: () =>
                                      firestoreService.deleteNote(docID),
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              nome,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          descricao,
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Text("No notes...");
          }
        },
      ),
    );
  }
}
