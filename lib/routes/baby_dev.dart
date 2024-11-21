import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PregnancyTracker extends StatefulWidget {
  const PregnancyTracker({Key? key}) : super(key: key);

  @override
  _PregnancyTrackerState createState() => _PregnancyTrackerState();
}

class _PregnancyTrackerState extends State<PregnancyTracker> {
  int _currentWeek = 1;
  DateTime? _dueDate;
  final TextEditingController _weekController = TextEditingController();
  
  // Weekly development information
  final Map<int, Map<String, dynamic>> weeklyInfo = {
    1: {
      'title': 'Week 1',
      'development': 'Your pregnancy journey begins!',
      'size': 'Smaller than a poppy seed',
      'image': 'assets/week1.png',
    },
    2: {
      'title': 'Week 2',
      'development': 'Your body is preparing for conception',
      'size': 'Poppy seed size',
      'image': 'assets/week2.png',
    },
    // Add more weeks here...
    40: {
      'title': 'Week 40',
      'development': 'Your baby is full term!',
      'size': 'Watermelon',
      'image': 'assets/week40.png',
    },
  };

  void _nextWeek() {
    if (_currentWeek < 40) {
      setState(() {
        _currentWeek++;
      });
    }
  }

  void _previousWeek() {
    if (_currentWeek > 1) {
      setState(() {
        _currentWeek--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pregnancy Journey'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Due date selector
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Due Date: ${_dueDate != null ? DateFormat('MMM dd, yyyy').format(_dueDate!) : 'Not set'}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _dueDate ?? DateTime.now().add(const Duration(days: 280)),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 280)),
                    );
                    if (picked != null) {
                      setState(() {
                        _dueDate = picked;
                      });
                    }
                  },
                  child: const Text('Set Due Date'),
                ),
              ],
            ),
          ),

          // Current week input
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _weekController,
                    decoration: const InputDecoration(
                      labelText: 'Current Week',
                      hintText: 'Enter your current week (1-40)',
                    ),
                    keyboardType: TextInputType.number,
                    onSubmitted: (value) {
                      final week = int.tryParse(value);
                      if (week != null && week >= 1 && week <= 40) {
                        setState(() {
                          _currentWeek = week;
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    final week = int.tryParse(_weekController.text);
                    if (week != null && week >= 1 && week <= 40) {
                      setState(() {
                        _currentWeek = week;
                      });
                    }
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          ),

          // Week navigation
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _currentWeek > 1 ? _previousWeek : null,
                  icon: const Icon(Icons.chevron_left),
                ),
                Text(
                  'Week $_currentWeek',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                IconButton(
                  onPressed: _currentWeek < 40 ? _nextWeek : null,
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),

          // Week information card
          Expanded(
            child: Card(
              margin: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            weeklyInfo[_currentWeek]?['title'] ?? '',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Baby Size: ${weeklyInfo[_currentWeek]?['size'] ?? ''}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            weeklyInfo[_currentWeek]?['development'] ?? '',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    // Placeholder for weekly development image
                    Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey[200],
                      child: Center(
                        child: Icon(
                          Icons.child_care,
                          size: 100,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _weekController.dispose();
    super.dispose();
  }
}