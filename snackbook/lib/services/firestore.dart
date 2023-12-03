import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection of notes
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  // CREATE: add a new note
  Future<void> addNote(
    String nome,
    String imagem,
    String descricao,
    List<String> ingredientes,
    List<String> instrucoes,
  ) async {
    await notes.add({
      'nome': nome,
      'imagem': imagem,
      'descricao': descricao,
      'ingredientes': ingredientes,
      'instrucoes': instrucoes,
      'timestamp': Timestamp.now(),
    });
  }

  // READ: get notes from database
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }

  // UPDATE: update notes given a doc id

  Future<void> updateNote(
    String docID,
    String newNome,
    String newImagem,
    String newDescricao,
    List<String> newIngredientes,
    List<String> newInstrucoes,
  ) {
    print("Antes de atualizar o documento");
    print("docID: $docID");
    print("newNome: $newNome");
    print("newImagem: $newImagem");
    print("newDescricao: $newDescricao");
    print("newIngredientes: $newIngredientes");
    print("newInstrucoes: $newInstrucoes");

    return notes.doc(docID).update({
      'nome': newNome,
      'imagem': newImagem,
      'descricao': newDescricao,
      'ingredientes': newIngredientes,
      'instrucoes': newInstrucoes,
    }).then((_) {
      print("Documento atualizado com sucesso!");
    }).catchError((error) {
      print("Erro ao atualizar o documento: $error");
    });
  }

  Future<void> deleteNote(String docID) async {
    await notes.doc(docID).delete();
  }
}
