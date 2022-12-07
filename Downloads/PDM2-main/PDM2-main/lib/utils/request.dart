import 'package:http/http.dart' as http;

class Requester {
  static Future<http.Response> doPostRequest(
      String url, Object body, Map<String, dynamic>? headers) async {
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          ...?headers
        },
        body: body);
    return response;
  }

  static Future<http.Response> doPutRequest(
      String url, Object body, Map<String, dynamic>? headers) async {
    final response = await http.put(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          ...?headers
        },
        body: body);
    return response;
  }

  static Future<http.Response> doGetRequest(
      String url, Map<String, dynamic>? headers) async {
    final response = await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
      ...?headers
    });
    return response;
  }

  static Future<http.Response> doDeleteRequest(
      String url, Map<String, dynamic>? headers) async {
    final response = await http.delete(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          ...?headers
        });
    return response;
  }
}
