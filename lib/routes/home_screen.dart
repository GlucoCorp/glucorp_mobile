import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/metric_chart.dart';
import '../widgets/feature_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maternal Health Dashboard'),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundImage: NetworkImage('https://placeholder.com/user.jpg'),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back, Sarah!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const HealthMetricChart(
              title: 'Blood Glucose Levels',
              data: [
                FlSpot(0, 95),
                FlSpot(1, 100),
                FlSpot(2, 98),
                FlSpot(3, 102),
                FlSpot(4, 97),
              ],
              unit: 'mg/dL',
            ),
            const SizedBox(height: 20),
            const HealthMetricChart(
              title: 'Blood Pressure',
              data: [
                FlSpot(0, 120),
                FlSpot(1, 118),
                FlSpot(2, 122),
                FlSpot(3, 119),
                FlSpot(4, 121),
              ],
              unit: 'mmHg',
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
                  color: Colors.blue,
                ),
                FeatureCard(
                  title: 'Community',
                  icon: Icons.people,
                  color: Colors.green,
                ),
                FeatureCard(
                  title: 'Chat with Doctor',
                  icon: Icons.chat,
                  color: Colors.purple,
                ),
                FeatureCard(
                  title: 'Health Records',
                  icon: Icons.folder,
                  color: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}