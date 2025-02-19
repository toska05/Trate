import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trate/models/test_model.dart';

class TestService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    try {
      var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      var response = await client.get(uri);

      if (response.statusCode == 200 || response.statusCode == 400) {
        var jsonData = json.decode(response.body) as List;
        List<Post> posts = jsonData.map((item) => Post.fromJson(item)).toList();
        return posts;
      } else {
        throw Exception('Failed to load data!');
      }
    } finally {
      client.close();
    }
  }
}
