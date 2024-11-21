import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/metric_chart.dart';
import '../widgets/feature_card.dart';
import '../routes/profile.dart';
import '../routes/baby_dev.dart'; // Import your destination screens here
import '../routes/community.dart';
import '../routes/chatbot.dart';
import '../routes/blood_pressure.dart';
import '../routes/blood_glucose.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String gender = 'female'; // Change this to 'male' or 'female' dynamically
  int _currentIndex = 0; // Tracks the selected index of the BottomNavigationBar

  // Add a function to handle card navigation
  void _onFeatureCardTap(String title) {
    switch (title) {
      case 'Baby Development':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PregnancyTracker()),
        );
        break;
      case 'Community':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommunityPage()),
        );
        break;
      case 'Chatbot':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatbotPage()),
        );
        break;
      case 'Blood Pressure':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BloodPressurePage()),
        );
        break;
      case 'Blood Glucose':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BloodGlucoseScreen()),
        );
        break;
    }
  }

  // Add a function to handle bottom navigation
  void _onBottomNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        // Already on HomeScreen
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BloodPressurePage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BloodGlucoseScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatbotPage()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PregnancyTracker()),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommunityPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final String avatarPath = gender == 'male'
        ? 'assets/images/man.jpeg'
        : 'assets/images/woman.jpeg';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage(avatarPath),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back, Sarah!',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                FeatureCard(
                  title: 'Baby Development',
                  icon: Icons.child_care,
                  color: const Color.fromRGBO(240, 98, 146, 1),
                  //onPressed: () => _onFeatureCardTap('Baby Development'),
                ),
                FeatureCard(
                  title: 'Community',
                  icon: Icons.people,
                  color: const Color.fromRGBO(240, 98, 146, 1),
                  //onPressed: () => _onFeatureCardTap('Community'),
                ),
                FeatureCard(
                  title: 'Chatbot',
                  icon: Icons.chat,
                  color: const Color.fromRGBO(240, 98, 146, 1),
                  //onPressed: () => _onFeatureCardTap('Chatbot'),
                ),
                FeatureCard(
                  title: 'Blood Pressure',
                  icon: Icons.favorite,
                  color: const Color.fromRGBO(240, 98, 146, 1),
                  //onPressed: () => _onFeatureCardTap('Blood Pressure'),
                ),
                FeatureCard(
                  title: 'Blood Glucose',
                  icon: Icons.line_axis,
                  color: const Color.fromRGBO(240, 98, 146, 1),
                  //onPressed: () => _onFeatureCardTap('Blood Glucose'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavigationTap,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Blood Pressure',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.line_axis),
            label: 'Blood Glucose',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chatbot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.child_care),
            label: 'Baby Development',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Community',
          ),
        ],
      ),
    );
  }
}
