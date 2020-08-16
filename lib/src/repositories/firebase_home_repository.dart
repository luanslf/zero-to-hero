import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zero_to_hero/src/interfaces/home_repository_interface.dart';

class FirebaseHomeRepository implements IHomeRepository {
  CollectionReference get tarefas => Firestore.instance.collection('/tarefas');

  @override
  Future<List<Map>> getTarefas() async {
    return (await tarefas.getDocuments())
        .documents
        .map((e) => {'name': e.data['name']})
        .toList();
  }

  @override
  Stream<List<Map>> streamTarefas() {
    return tarefas.snapshots().map((event) =>
        event.documents.map((e) => {'name': e.data['name']}).toList());
  }
}
