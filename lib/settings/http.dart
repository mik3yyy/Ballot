import 'dart:convert';
import 'package:http/http.dart' as http;
import 'hive.dart';

class HTTP {
  static Future<Map<String, dynamic>> get(
      {required String link,
      bool authorization = true,
      Map<String, String>? map}) async {
    http.Response res = await http.get(
      Uri.parse(link),
      headers: map ??
          {
            "Authorization":
                authorization ? "Bearer ${HiveFunction.getToken()}" : "",
            "Accept": "application/json",
            "token": HiveFunction.getToken()
            // 'Content-Type': 'application/json'
          },
    );
    return json.decode(res.body);
  }

  static Future<List<dynamic>> getList(
      {required String link, bool authorization = true}) async {
    http.Response res = await http.get(
      Uri.parse(link),
      headers: {
        "Authorization":
            authorization ? "Bearer ${HiveFunction.getToken()}" : "",
        "Accept": "application/json",
        // 'Content-Type': 'application/json'
      },
    );
    return json.decode(res.body);
  }

  static Future<Map<String, dynamic>> post(
      {required String link,
      Map<String, dynamic>? body,
      Map<String, String>? header,
      bool authorization = true}) async {
    http.Response res = await http.post(
      Uri.parse(link),
      headers: header ??
          {
            'token': HiveFunction.getToken(),
            "Authorization":
                authorization ? "Bearer ${HiveFunction.getToken()}" : "",
            "Accept": "application/json",
            'Content-Type': 'application/json'
          },
      body: json.encode(body),
    );
    print(json.decode(res.body));
    return json.decode(res.body);
  }

  static Future<Map<String, dynamic>> put(
      {required String link,
      Map<String, dynamic>? body,
      bool authorization = true}) async {
    http.Response res = await http.put(
      Uri.parse(link),
      headers: {
        "Authorization":
            authorization ? "Bearer ${HiveFunction.getToken()}" : "",
        "Accept": "application/json",
        'Content-Type': 'application/json'
      },
      body: json.encode(body),
    );
    return json.decode(res.body);
  }

  static Future<Map<String, dynamic>> delete(
      {required String link,
      Map<String, dynamic>? body,
      bool authorization = true}) async {
    http.Response res = await http.delete(
      Uri.parse(link),
      headers: {
        "Authorization":
            authorization ? "Bearer ${HiveFunction.getToken()}" : "",
        "Accept": "application/json",
        'Content-Type': 'application/json'
      },
      body: json.encode(body),
    );
    return json.decode(res.body);
  }
}
