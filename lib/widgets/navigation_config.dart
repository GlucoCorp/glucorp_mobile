import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../routes/home_screen.dart';
import '../routes/blood_pressure.dart';
import '../routes/blood_glucose.dart';
import '../routes/chatbot.dart';
import '../routes/baby_dev.dart';
import '../routes/community.dart';

class NavigationConfig extends ChangeNotifier {
  int _currentIndex = 0;
  
  int get currentIndex => _currentIndex;

  // Singleton pattern
  static final NavigationConfig _instance = NavigationConfig._internal();
  
  factory NavigationConfig() {
    return _instance;
  }
  
  NavigationConfig._internal();

  final List<NavigationItem> items = [
    NavigationItem(
      icon: Icons.home,
      label: 'Home',
      widget: HomeScreen(),
    ),
    NavigationItem(
      icon: Icons.favorite,
      label: 'Blood Pressure',
      widget: BloodPressurePage(),
    ),
    NavigationItem(
      icon: Icons.line_axis,
      label: 'Blood Glucose',
      widget: BloodGlucoseScreen(),
    ),
    NavigationItem(
      icon: Icons.chat,
      label: 'Chatbot',
      widget: ChatbotPage(),
    ),
    NavigationItem(
      icon: Icons.child_care,
      label: 'Baby Development',
      widget: PregnancyTracker(),
    ),
    NavigationItem(
      icon: Icons.people,
      label: 'Community',
      widget: CommunityPage(),
    ),
  ];

  Widget buildBottomNav(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        _currentIndex = index;
        notifyListeners();
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
      items: items.map((item) => BottomNavigationBarItem(
        icon: Icon(item.icon),
        label: item.label,
      )).toList(),
    );
  }
}

class NavigationItem {
  final IconData icon;
  final String label;
  final Widget widget;

  NavigationItem({
    required this.icon,
    required this.label,
    required this.widget,
  });
}
