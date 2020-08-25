abstract class IHttpClientService {
  Future<Map<String, dynamic>> get(String url);
}