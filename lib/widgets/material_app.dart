import 'package:flutter/material.dart';
import 'package:glucorp_mobile/routes/login.dart'; // Import the Login screen
import 'package:glucorp_mobile/routes/home_screen.dart'; // Import the Home screen
import 'package:glucorp_mobile/routes/forgot_password.dart'; // Import the Forgot Password screen
import 'package:glucorp_mobile/routes/signup.dart'; // Import the Sign Up screen
import 'package:glucorp_mobile/routes/welcome.dart'; // Import the Onboarding screen
import 'package:glucorp_mobile/routes/email_verification.dart'; // Import the Email Verification screen

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable debug banner
      home: const Login(), // Set the starting screen
      routes: {
        '/': (context) => const OnboardingScreen(), // Define the Onboarding screen route 
        '/signup': (context) => const SignUp(), // Define the Sign Up screen route
        '/login': (context) => const Login(), // Define the Login screen route
        '/home': (context) => const HomeScreen(), // Define the Home screen route
        '/forgot-password': (context) => const ForgotPasswordScreen(), // Define the Forgot Password screen route
        //'/email-verification': (context) => const VerificationScreen(), // Define the Email Verification screen route
      },
      // Optional: Handle undefined routes
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Page not found!'),
          ),
        ),
      ),
    );
  }
}
