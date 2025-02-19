import 'package:flutter/material.dart';
import 'package:trate/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color.fromARGB(255, 83, 137, 181),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 22.0, 
            color: const Color.fromARGB(255, 83, 137, 181),
          ),
          
          titleMedium: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 83, 137, 181),
          ),
          
          bodyMedium: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}




// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:trate/pages/login/login_page.dart';

// void main() {
//   HttpOverrides.global = MyHttpOverrides(); 
//   runApp(MyApp());
// }

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image Loader',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         fontFamily: 'Poppins',
//         primaryColor: Colors.white,
//         floatingActionButtonTheme: FloatingActionButtonThemeData(
//           elevation: 0,
//           foregroundColor: Colors.white,
//         ),
//         colorScheme: ColorScheme.fromSwatch().copyWith(
//           secondary: Color.fromARGB(255, 83, 137, 181),
//         ),
//         textTheme: TextTheme(
//           titleLarge: TextStyle(
//             fontSize: 22.0, 
//             color: const Color.fromARGB(255, 83, 137, 181),
//           ),
//           titleMedium: TextStyle(
//             fontSize: 24.0,
//             fontWeight: FontWeight.w700,
//             color: Color.fromARGB(255, 83, 137, 181),
//           ),
//           bodyMedium: TextStyle(
//             fontSize: 14.0,
//             fontWeight: FontWeight.w400,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       home: LoginPage(),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// import 'package:trate/components/custom_http_client.dart'; 
// import 'package:trate/pages/login/login_page.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized(); 
//   final client = CustomHttpClient.create(); 

//   try {
//     final response = await client.get(Uri.parse('https://34.34.140.113/'));

//     if (response.statusCode == 200) {
//       print('Dane z serwera: ${response.body}');
//     } else {
//       print('Błąd: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Błąd połączenia: $e');
//   }

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image Loader',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         fontFamily: 'Poppins',
//         primaryColor: Colors.white,
//         floatingActionButtonTheme: FloatingActionButtonThemeData(
//           elevation: 0,
//           foregroundColor: Colors.white,
//         ),
//         colorScheme: ColorScheme.fromSwatch().copyWith(
//           secondary: Color.fromARGB(255, 83, 137, 181),
//         ),
//         textTheme: TextTheme(
//           titleLarge: TextStyle(
//             fontSize: 22.0, 
//             color: const Color.fromARGB(255, 83, 137, 181),
//           ),
          
//           titleMedium: TextStyle(
//             fontSize: 24.0,
//             fontWeight: FontWeight.w700,
//             color: Color.fromARGB(255, 83, 137, 181),
//           ),
          
//           bodyMedium: TextStyle(
//             fontSize: 14.0,
//             fontWeight: FontWeight.w400,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       home: LoginPage(),
//     );
//   }
// }
