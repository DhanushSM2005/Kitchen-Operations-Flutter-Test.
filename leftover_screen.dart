import 'package:flutter/material.dart';

class LeftoverScreen extends StatelessWidget {
  const LeftoverScreen({super.key});
  final List<Map<String, dynamic>> leftoverItems = const [
    {
      'item': 'Chicken Biryani',
      'quantity': '10 kg',
      'recordedBy': 'Rajesh S.',
      'time': '12:30 PM',
    },
    {
      'item': 'Vegetable Curry',
      'quantity': '5 kg',
      'recordedBy': 'Priya M.',
      'time': '01:00 PM',
    },
    {
      'item': 'Mashed Potatoes',
      'quantity': '3 kg',
      'recordedBy': 'Chef John',
      'time': '02:00 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Leftover Inventory', style: theme.textTheme.titleLarge),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: leftoverItems.length,
              itemBuilder: (context, index) {
                final item = leftoverItems[index];
                return Card(
                  color: theme.cardColor,
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    title: Text(
                      item['item'] as String,
                      style: theme.textTheme.labelLarge,
                    ),
                    subtitle: Text(
                      'Recorded By: ${item['recordedBy']}',
                      style: theme.textTheme.bodyMedium,
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item['quantity'] as String,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          item['time'] as String,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_circle_outline, color: Colors.white),
              label: const Text(
                'Add New Leftover',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
