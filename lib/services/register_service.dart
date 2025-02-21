import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trate/models/register_model.dart';
import 'package:trate/services/session_manager.dart';

class RegisterService {

  Future<RegisterResponseModel> register(RegisterRequestModel requestModel) async {
    String url = "https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/auth/register";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestModel.toJson()),
      );

  if (response.statusCode == 200) {
        var data = json.decode(response.body);
        final user = RegisterResponseModel.fromJson(data, requestModel.email);
        SessionManager().setUser(user); 
        return user;
      } else {
        throw Exception("Registration failed");
      }
    } catch (e) {
      throw Exception("Registration request failed: $e");
    }
  }

}
