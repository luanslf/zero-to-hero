import 'package:dio/dio.dart';
import 'package:zero_to_hero/src/interfaces/http_client_service_interface.dart';

class DioHttpClientService implements IHttpClientService {
  Dio _httpClient = Dio();

  @override
  Future<Map<String, dynamic>> get(String url) async {
    Response response = await _httpClient.get(url);
    return {'status': response.statusCode, 'data': response.data};
  }
}
