import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  // get collection of notes
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  // CREATE: add a new note
  Future<void> addNote(String nome, String imagem, String descricao) {
    return notes.add({
      'nome':nome,
      'imagem': imagem,
      'descricao': descricao,
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

Future<void> updateNote(String docID, String newNome, String newImagem, String newDescricao) {
    return notes.doc(docID).update({
      'nome':newNome,
      'imagem': newImagem,
      'descricao': newDescricao,
    });
}

  // DELETE: delete notes given a doc id
Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
}
}