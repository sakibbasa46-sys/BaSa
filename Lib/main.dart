import 'package:flutter/material.dart';

void main() {
  runApp(const BasaApp());
}

class BasaApp extends StatelessWidget {
  const BasaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BaSa - বাসা ভাড়া অ্যাপ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BaSa (বাসা খুঁজে নিন)'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.home, size: 80, color: Colors.teal),
            SizedBox(height: 16),
            Text(
              'BaSa অ্যাপে আপনাকে স্বাগতম!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'সহজেই বাসা খুঁজে নেওয়ার জন্য আপনার বিশ্বস্ত প্ল্যাটফর্ম।',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
