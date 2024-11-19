import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glucorp_mobile/routes/login.dart';
import 'package:glucorp_mobile/routes/signup.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    const OnboardingPage(
      title: 'Track your and your baby\'s\nhealth with ease',
      description:
          'Your personal health assistant will help you\nkeep track of your health and your baby\'s growth',
      imagePath: 'assets/images/Pregnant_woman.png',
      buttonText: 'Continue',
    ),
    const OnboardingPage(
      title: 'Get personalized\nhealth tips and\nreminders',
      description:
          'Get daily health tips and reminders to help\nyou stay healthy throughout your pregnancy',
      imagePath: 'assets/images/Pregnant_woman.png',
      buttonText: 'Continue',
    ),
    const OnboardingPage(
      title: 'Get to interact with\nother expecting mothers',
      description:
          'Join a community of expecting mothers\nand share your experiences with each other',
      imagePath: 'assets/images/Pregnant_woman.png',
      buttonText: 'Sign up',
      showLoginButton: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[300],
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return _pages[index].copyWith(
                onButtonPressed: () {
                  if (_currentPage < _pages.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    // Handle sign up button press
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  }
                },
              );
            },
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: _pages.length,
                  effect: const WormEffect(
                    dotColor: Colors.white30,
                    activeDotColor: Colors.white,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String buttonText;
  final bool showLoginButton;
  final VoidCallback? onButtonPressed;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.buttonText,
    this.showLoginButton = false,
    this.onButtonPressed,
  });

  OnboardingPage copyWith({VoidCallback? onButtonPressed}) {
    return OnboardingPage(
      title: title,
      description: description,
      imagePath: imagePath,
      buttonText: buttonText,
      showLoginButton: showLoginButton,
      onButtonPressed: onButtonPressed ?? this.onButtonPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white70,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          Image.asset(
            imagePath,
            height: 200,
            fit: BoxFit.contain,
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: onButtonPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            child: Text(buttonText),
          ),
          if (showLoginButton) ...[
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Handle login button press
                // Navigate to the Login Screen
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
                backgroundColor: Colors.white,
              ),
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}


