// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// // import 'package:trate/models/register_model.dart';

// // class RegisterService {
// //   static RegisterResponseModel? _currentUser;

// //   Future<RegisterResponseModel> register(RegisterRequestModel requestModel) async {
// //     String url = "https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/auth/register";

// //     try {
// //       final response = await http.post(
// //         Uri.parse(url),
// //         headers: {"Content-Type": "application/json"},
// //         body: jsonEncode(requestModel.toJson()),
// //       );

// // //       if (response.statusCode == 200 || response.statusCode == 400) {
// // //         return RegisterResponseModel.fromJson(json.decode(response.body));
// // //       } else {
// // //         throw Exception('Błąd logowania: ${response.statusCode}');
// // //       }
// // //     } catch (e) {
// // //       throw Exception('Błąd połączenia: $e');
// // //     }
// // //   }
// // // }
// //   if (response.statusCode == 200) {
// //         var data = json.decode(response.body);
// //         _currentUser = RegisterResponseModel.fromJson(data, requestModel.email);
// //         return _currentUser!;
// //       } else {
// //         throw Exception("Login failed");
// //       }
// //     } catch (e) {
// //       throw Exception("Login request failed: $e");
// //     }
// //   }

// //   static RegisterResponseModel? getCurrentUser() {
// //     return _currentUser;
// //   }

// //   static String? getCurrentUserEmail() {
// //     return _currentUser?.email;
// //   }

// //   static void logout() {
// //     _currentUser = null;
// //   }
// // }
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:trate/models/register_model.dart';
// import 'package:trate/services/session_manager.dart';

// class RegisterService {

//   Future<RegisterResponseModel> register(RegisterRequestModel requestModel) async {
//     String url = "https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/auth/register";

//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(requestModel.toJson()),
//       );

//   if (response.statusCode == 200) {
//         var data = json.decode(response.body);
//         final user = RegisterResponseModel.fromJson(data, requestModel.email);
//         SessionManager().setUser(user); 
//         return user;
//       } else {
//         throw Exception("Registration failed");
//       }
//     } catch (e) {
//       throw Exception("Registration request failed: $e");
//     }
//   }

// }

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trate/models/register_model.dart';
import 'package:trate/services/session_manager.dart';

class RegisterService {
  static RegisterResponseModel? _currentUser;

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
