import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trate/models/tranlation_data_model.dart';

class DataService {
  Future<bool> saveTranslation(Post post) async {
    var client = http.Client();
    var uri = Uri.parse('https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/processtranslation');

    try {
      var response = await client.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(post.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    } finally {
      client.close();
    }
  }
}

