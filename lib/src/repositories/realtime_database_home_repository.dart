import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/rendering.dart';
import 'package:zero_to_hero/src/interfaces/home_repository_interface.dart';

class RealtimeDatabaseHomeRepository implements IHomeRepository {
  DatabaseReference get tarefas =>
      FirebaseDatabase.instance.reference().child('tarefas');

  @override
  Future<List<Map>> getTarefas() async {
    final snapshot = await tarefas.once();
    Map dataMap = snapshot.value;
    return dataMap.values.map((e) => {'name': e['name']}).toList();
  }

  @override
  Stream<List> streamTarefas() {
    return tarefas.onValue.map((event) =>
        event.snapshot.value.values.map((e) => {'name': e['name']}).toList());
    /* return tarefas.onValue.map((event) =>
        event.snapshot.value.values.map((e) => {'name': e['name']}).toList()); */
  }
}
