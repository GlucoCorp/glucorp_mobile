import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/metric_chart.dart';
import '../widgets/feature_card.dart';
import '../routes/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String gender = 'female'; // Change this to 'male' or 'female' dynamically
  int _currentIndex = 0; // Tracks the selected index of the BottomNavigationBar

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
              // Handle avatar click (optional functionality)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen())
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
              children: const [
                FeatureCard(
                  title: 'Baby Development',
                  icon: Icons.child_care,
                  color: Color.fromRGBO(240, 98, 146, 1),
                ),
                FeatureCard(
                  title: 'Community',
                  icon: Icons.people,
                  color: Color.fromRGBO(240, 98, 146, 1),
                ),
                FeatureCard(
                  title: 'Chatbot',
                  icon: Icons.chat,
                  color: Color.fromRGBO(240, 98, 146, 1),
                ),
                FeatureCard(
                  title: 'Blood Pressure',
                  icon: Icons.favorite,
                  color: Color.fromRGBO(240, 98, 146, 1),
                ),
                FeatureCard(
                  title: 'Blood Glucose', 
                  icon: Icons.line_axis, 
                  color: Color.fromRGBO(240, 98, 146, 1)
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          // Handle navigation here based on the index
          print('Selected index: $index');
        },
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
            label: 'Chatbot'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.child_care),
            label: 'Baby Development'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Community'
          ),
        ],
      ),
    );
  }
}