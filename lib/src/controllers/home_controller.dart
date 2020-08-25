import 'package:zero_to_hero/src/interfaces/home_repository_interface.dart';
import 'package:zero_to_hero/src/models/tarefa_model.dart';
import 'package:zero_to_hero/src/repositories/firestore_home_repository.dart';
import 'package:zero_to_hero/src/repositories/hasura_home_repository.dart';
import 'package:zero_to_hero/src/repositories/realtime_database_home_repository.dart';

class HomeController {
  final IHomeRepository firestoreHomeRepository = FirestoreHomeRepository();
  final IHomeRepository hasuraHomeRepository = HasuraHomeRepository();
  final IHomeRepository realtimeDatabaseHomeRepository =
      RealtimeDatabaseHomeRepository();

  Future<List<Tarefa>> getTarefas() async {
    //List<Map> maps = await firestoreHomeRepository.getTarefas();
    //List<Map> maps = await realtimeDatabaseHomeRepository.getTarefas();
    List<Map> maps = await hasuraHomeRepository.getTarefas();
    return maps.map((e) => Tarefa.fromMap(e)).toList();
  }

  Stream<List<Tarefa>> streamTarefas() {
    //Stream<List> stream = realtimeDatabaseHomeRepository.streamTarefas();
    //return stream.map((event) => event.map((e) => Tarefa.fromMap(e)).toList());
    //Stream<List<Map>> stream = firestoreHomeRepository.streamTarefas();
    //return stream.map((event) => event.map((e) => Tarefa.fromMap(e)).toList());
    Stream<List<Map>> stream = hasuraHomeRepository.streamTarefas();
    return stream.map((event) => event.map((e) => Tarefa.fromMap(e)).toList());
  }
}
