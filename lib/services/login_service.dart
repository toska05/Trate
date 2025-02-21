// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// // import 'package:trate/models/login_model.dart';

// // class LoginService {
// //   static LoginResponseModel? _currentUser;

// //   Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
// //     String url = "https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/auth/login";

// //     try {
// //       final response = await http.post(
// //         Uri.parse(url),
// //         headers: {'Content-Type': 'application/json'},
// //         body: jsonEncode(requestModel.toJson()),
// //       );

// //       if (response.statusCode == 200 || response.statusCode == 400) {
// //         var data = json.decode(response.body);
// //         print(data);
// //         _currentUser = LoginResponseModel.fromJson(data, requestModel.email);
// //         return _currentUser!;
// //       } else {
// //         throw Exception("Login failed");
// //       }
// //     } catch (e) {
// //       throw Exception("Login request failed: $e");
// //     }
// //   }

// //   static LoginResponseModel? getCurrentUser() {
// //     return _currentUser;
// //   }

// //   static String? getCurrentUserEmail() {
// //     return _currentUser?.email;
// //   }

// //   static void logout() {
// //     _currentUser = null;
// //   }
// // }


// // //     try {
// // //       final response = await http.post(
// // //         Uri.parse(url),
// // //         headers: {"Content-Type": "application/json"},  
// // //         body: jsonEncode(requestModel.toJson()), 
// // //       );

// // //       if (response.statusCode == 200 || response.statusCode == 400) {
// // //         return LoginResponseModel.fromJson(json.decode(response.body));
// // //       } else {
// // //         throw Exception('Błąd logowania: ${response.statusCode}');
// // //       }
// // //     } catch (e) {
// // //       throw Exception('Błąd połączenia: $e');
// // //     }
// // //   }
// // // }


// // //test
// // // import 'package:http/http.dart' as http;
// // // import 'dart:convert';
// // // import 'package:trate/models/login_model.dart';

// // // class LoginService {
// // //   static LoginResponseModel? _currentUser;

// // //   Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
// // //     String url = 'https://reqres.in/api/login';

// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:trate/models/login_model.dart';
// import 'package:trate/services/session_manager.dart';

// class LoginService {
//   static LoginResponseModel? _currentUser;

//   Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
//     String url = "https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/auth/login";

//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(requestModel.toJson()),
//       );

//       if (response.statusCode == 200 || response.statusCode == 400) {
//         var data = json.decode(response.body);
//         print(data);
//         final user = LoginResponseModel.fromJson(data, requestModel.email);
//         SessionManager().setUser(user);
//         return user;
//       } else {
//         throw Exception("Login failed");
//       }
//     } catch (e) {
//       throw Exception("Login request failed: $e");
//     }
//   }

// }

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trate/models/login_model.dart';
import 'package:trate/services/session_manager.dart';

class LoginService {
  static LoginResponseModel? _currentUser;

  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/auth/login";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestModel.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 400) {
        var data = json.decode(response.body);
        print(data);
        final user = LoginResponseModel.fromJson(data, requestModel.email);
        SessionManager().setUser(user);
        return user;
      } else {
        throw Exception("Login failed");
      }
    } catch (e) {
      throw Exception("Login request failed: $e");
    }
  }

}
