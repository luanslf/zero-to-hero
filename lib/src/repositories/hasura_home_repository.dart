import 'package:hasura_connect/hasura_connect.dart';
import 'package:zero_to_hero/src/interfaces/home_repository_interface.dart';
import 'package:zero_to_hero/src/shared/constants.dart';

class HasuraHomeRepository implements IHomeRepository {
  HasuraConnect _hasuraConnect = HasuraConnect(hasuraUrl);

  @override
  Future<List<Map>> getTarefas() async {
    final response = await _hasuraConnect.query('''
    {
      tarefas {
        id
        name
      }
    }
    ''');
    return (response['data']['tarefas'] as List)
        .map((e) => {'name': e['name']})
        .toList();
  }

  @override
  Stream<List<Map>> streamTarefas() {
    return _hasuraConnect.subscription('''
    {
      tarefas {
        id
        name
      }
    }
    ''').map((event) => (event['data']['tarefas']
            as List)
        .map((e) => {'name': e['name']})
        .toList());
  }
}
