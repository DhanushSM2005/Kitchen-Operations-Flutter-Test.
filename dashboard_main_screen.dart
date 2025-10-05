import 'package:flutter/material.dart';

class DashboardMainScreen extends StatelessWidget {
  const DashboardMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Map<String, dynamic>> metrics = [
      const {
        'title': 'Total Sales (Today)',
        'value': '₹ 1,50,000',
        'icon': Icons.attach_money,
        'color': Colors.green,
      },
      const {
        'title': 'Pending Orders',
        'value': '15',
        'icon': Icons.assignment_late_outlined,
        'color': Colors.orange,
      },
      const {
        'title': 'Food Cost %',
        'value': '28.5%',
        'icon': Icons.pie_chart_outline,
        'color': Colors.blue,
      },
      {
        'title': 'Employee Utilization',
        'value': '85%',
        'icon': Icons.people_outline,
        'color': theme.primaryColor,
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            [
              Text(
                'Key Performance Indicators',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 16),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 1.2,
                ),
                itemCount: metrics.length,
                itemBuilder: (context, index) {
                  final metric = metrics[index];
                  return Card(
                    color: theme.cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            metric['icon'] as IconData,
                            color: metric['color'] as Color,
                            size: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                metric['title'] as String,
                                style: theme.textTheme.bodyMedium,
                              ),
                              Text(
                                metric['value'] as String,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  color: metric['color'] as Color,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),

              Text('Recent Activities', style: theme.textTheme.titleLarge),
              const SizedBox(height: 8),
              ...[
                'Purchase Order PO-1002 Confirmed',
                'Beef Stock is Critical',
                'Rahul K. shift started',
              ],
            ].map((item) {
              if (item is String) {
                return ListTile(
                  leading: Icon(
                    Icons.circle,
                    size: 8,
                    color: theme.primaryColor,
                  ),
                  title: Text(item, style: theme.textTheme.bodyLarge),
                );
              }
              return item as Widget;
            }).toList(),
      ),
    );
  }
}
