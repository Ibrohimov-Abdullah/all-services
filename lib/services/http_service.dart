import "dart:convert";
import "package:http/http.dart" as http;
import "package:http/http.dart%20";


class Api {
  // baseurl
  static const String baseurl = "10.10.2.136:8080";


  // ignore: non_constant_identifier_names
  static Future<String?> GET(
      String api,
      ) async {
    final Uri url = Uri.http(baseurl, api);
    final Response response = await http.get(url, headers: {
      "Content-Type": "application/json",
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  // ignore: non_constant_identifier_names
  static Future<String?> POST(String api, Map<String, dynamic> body) async {
    final Uri url = Uri.http(baseurl, api);

    final Response response = await http.post(url, headers: {
      "Content-Type": "application/json",
    }, body: jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }

  // ignore: non_constant_identifier_names
  static Future<String?> PUT(String api, Map<String, dynamic> body, Map<String, dynamic> param) async {
    final Uri url = Uri.https(baseurl, api, param);

    final Response response = await http.put(url, body: jsonEncode(body), headers: {
      "Content-Type": "application/json",
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }

  /// params

  static Map<String, String> emptyParams() => <String, String>{};

  /// body

  static Map<String, dynamic> bodyEmpty() => <String, dynamic>{};
}