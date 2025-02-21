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
