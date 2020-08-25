import 'package:zero_to_hero/src/interfaces/home_repository_interface.dart';
import 'package:zero_to_hero/src/interfaces/http_client_service_interface.dart';
import 'package:zero_to_hero/src/services/dio_http_client_service.dart';
import 'package:zero_to_hero/src/shared/constants.dart';

class JsonPlaceholderHomeRepository implements IHomeRepository {
  IHttpClientService _httpClient;
  final String _toDosUrl = jsonPlaceholderToDosUrl;

  JsonPlaceholderHomeRepository() {
    _httpClient = DioHttpClientService();
  }

  @override
  Future<List<Map>> getTarefas() async {
    Map<String, dynamic> responseMap = await _httpClient.get(_toDosUrl);
    return (responseMap['data'] as List)
        .map((e) => {'name': e['title']})
        .toList();
  }

  @override
  Stream streamTarefas() {
    // TODO: implement streamTarefas
    throw UnimplementedError();
  }
}
