import 'package:flutter/material.dart';
import 'package:prototype/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.teal.shade400),
        focusColor: Colors.teal.shade400,
        scaffoldBackgroundColor: Color.fromRGBO(222, 255, 249, 1),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.teal.shade400,
        ),
      ),
      home: Scaffold(
        body: Login_Page(),
      ),
    );
  }
}
