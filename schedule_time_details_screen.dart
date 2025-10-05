import 'package:flutter/material.dart';

class ScheduleTimeDetailsScreen extends StatelessWidget {
  final String time;
  const ScheduleTimeDetailsScreen({super.key, required this.time});
  final List<Map<String, String>> tasks = const [
    {'task': 'Prep Mise en Place for Breakfast Buffet', 'status': 'Pending'},
    {'task': 'Verify Guest Buffet Menu Items', 'status': 'Completed'},
    {'task': 'Assign Live Counter Stations', 'status': 'In Progress'},
    {'task': 'Inventory Check (Dairy/Produce)', 'status': 'Completed'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Schedule Details: $time',
          style: theme.textTheme.titleLarge,
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tasks for $time Slot', style: theme.textTheme.titleLarge),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  Color statusColor = Colors.orange;
                  if (task['status'] == 'Completed') {
                    statusColor = theme.primaryColor;
                  } else if (task['status'] == 'Pending') {
                    statusColor = Colors.red;
                  }

                  return Card(
                    color: theme.cardColor,
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: ListTile(
                      title: Text(
                        task['task']!,
                        style: theme.textTheme.labelLarge,
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          task['status']!,
                          style: TextStyle(
                            color: statusColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('View Full Shift Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
