import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://aishki.helioho.st/";

  static Future<Map<String, dynamic>> registerUser(
      String name, String uname, String upass) async {
    final response = await http.post(
      Uri.parse("$baseUrl/register.php"),
      body: {"name": name, "uname": uname, "upass": upass},
    );
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> loginUser(
      String uname, String upass) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login.php"),
      body: {"uname": uname, "upass": upass},
    );
    return jsonDecode(response.body);
  }
}
