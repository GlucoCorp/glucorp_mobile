// Blood Pressure Page
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/navigation_config.dart';

class BloodPressurePage extends StatefulWidget {
  @override
  
  _BloodPressurePageState createState() => _BloodPressurePageState();
}

class BPReading {
  final DateTime date;
  final int systolic;
  final int diastolic;

  BPReading(this.date, this.systolic, this.diastolic);
}

class _BloodPressurePageState extends State<BloodPressurePage> {
  int _currentIndex = 0;
  final List<BPReading> readings = [
    BPReading(DateTime.now().subtract(Duration(days: 6)), 120, 80),
    BPReading(DateTime.now().subtract(Duration(days: 5)), 118, 79),
    BPReading(DateTime.now().subtract(Duration(days: 4)), 122, 82),
    BPReading(DateTime.now().subtract(Duration(days: 3)), 119, 81),
    BPReading(DateTime.now().subtract(Duration(days: 2)), 121, 80),
    BPReading(DateTime.now().subtract(Duration(days: 1)), 117, 78),
    BPReading(DateTime.now(), 120, 81),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Blood Pressure',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Latest Reading',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildReadingValue('120', 'Systolic', Colors.pink[300]!),
                        Container(
                          height: 50,
                          width: 1,
                          color: Colors.grey[300],
                        ),
                        _buildReadingValue('80', 'Diastolic', Colors.blue[300]!),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Weekly Trend',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 300,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        interval: 20,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 22,
                        getTitlesWidget: (value, meta) {
                          TextStyle style = GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 12,
                          );
                          switch (value.toInt()) {
                            case 0:
                              return Text('Mon', style: style);
                            case 3:
                              return Text('Thu', style: style);
                            case 6:
                              return Text('Sun', style: style);
                            default:
                              return Text('', style: style);
                          }
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: readings
                          .asMap()
                          .entries
                          .map((e) => FlSpot(
                                e.key.toDouble(),
                                e.value.systolic.toDouble(),
                              ))
                          .toList(),
                      isCurved: true,
                      color: Colors.pink[300]!,
                      dotData: FlDotData(show: false),
                    ),
                    LineChartBarData(
                      spots: readings
                          .asMap()
                          .entries
                          .map((e) => FlSpot(
                                e.key.toDouble(),
                                e.value.diastolic.toDouble(),
                              ))
                          .toList(),
                      isCurved: true,
                      color: const Color.fromRGBO(100, 181, 246, 1)!,
                      dotData: FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new reading
        },
        backgroundColor: Colors.pink[300],
        child: Icon(Icons.add),
      ),
       bottomNavigationBar: NavigationConfig().buildBottomNav(context),
    );  
  }

  Widget _buildReadingValue(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            color: Colors.grey,
          ),
        ),
      ],
      );
  }
}


