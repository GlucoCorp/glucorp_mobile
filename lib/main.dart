import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glucorp_mobile/routes/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GluCorp Mobile App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2962FF),
          primary: const Color(0xFF2962FF),
        ),
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: const OnboardingScreen(),
    );
  }
}