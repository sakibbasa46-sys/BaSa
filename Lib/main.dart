import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(const BaSaApp());
}

class BaSaApp extends StatelessWidget {
  const BaSaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BaSa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const LoginScreen(),
    );
  }
}
