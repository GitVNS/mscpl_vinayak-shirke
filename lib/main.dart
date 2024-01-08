import 'package:flutter/material.dart';
import 'package:fydaa_assignment/presentation/pages/mobile_input_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MobileInputPage(),
    );
  }
}
