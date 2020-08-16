import 'package:zero_to_hero/src/interfaces/home_repository_interface.dart';
import 'package:zero_to_hero/src/models/tarefa_model.dart';
import 'package:zero_to_hero/src/repositories/firebase_home_repository.dart';

class HomeController {
  final IHomeRepository homeRepository = FirebaseHomeRepository();

  Future<List<Tarefa>> getTarefas() async {
    List<Map> maps = await homeRepository.getTarefas();
    return maps.map((e) => Tarefa.fromMap(e)).toList();
  }

  Stream<List<Tarefa>> streamTarefas() {
    Stream<List<Map>> stream = homeRepository.streamTarefas();
    return stream.map((event) => event.map((e) => Tarefa.fromMap(e)).toList());
  }
}
