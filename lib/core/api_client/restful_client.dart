abstract class RestfulClient<T> {
  Future<T> get(String url);
  Future<T> post(String url, Map<String, dynamic> body);
  Future<T> put(String url, Map<String, dynamic> body);
  Future<T> delete(String url);
}
