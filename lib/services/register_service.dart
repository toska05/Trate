import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trate/models/register_model.dart';

class APIService {
  Future<RegisterResponseModel> register(RegisterRequestModel requestModel) async {
    String url = "https://reqres.in/api/register";

    final response = await http.post(
      Uri.parse(url),
      body: requestModel.toJson(),
    );

    if (response.statusCode == 200 || response.statusCode == 400) {
      return RegisterResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to register user!');
    }
  }
}
