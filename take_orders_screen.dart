import 'package:flutter/material.dart';

class TakeOrdersScreen extends StatelessWidget {
  const TakeOrdersScreen({super.key});
  final List<Map<String, dynamic>> tables = const [
    {'id': 1, 'status': 'Occupied', 'orders': 3, 'time': '25 min'},
    {'id': 2, 'status': 'Available', 'orders': 0, 'time': '-'},
    {'id': 3, 'status': 'Needs Cleanup', 'orders': 0, 'time': '-'},
    {'id': 4, 'status': 'Occupied', 'orders': 1, 'time': '10 min'},
    {'id': 5, 'status': 'Available', 'orders': 0, 'time': '-'},
    {'id': 6, 'status': 'Occupied', 'orders': 5, 'time': '40 min'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Restaurant Floor Status', style: theme.textTheme.titleLarge),
          const SizedBox(height: 16),

          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.9,
              ),
              itemCount: tables.length,
              itemBuilder: (context, index) {
                final table = tables[index];
                Color statusColor;
                if (table['status'] == 'Occupied') {
                  statusColor = Colors.red;
                } else if (table['status'] == 'Available') {
                  statusColor = theme.primaryColor;
                } else {
                  statusColor = Colors.yellow.shade700;
                }

                return InkWell(
                  onTap: () {},
                  child: Card(
                    color: theme.cardColor,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: statusColor, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Table ${table['id']}',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: statusColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            table['status'] as String,
                            style: theme.textTheme.bodyLarge,
                          ),
                          if (table['orders'] > 0)
                            Text(
                              'Orders: ${table['orders']} / Time: ${table['time']}',
                              style: theme.textTheme.bodyMedium,
                            ),
                          if (table['status'] == 'Available')
                            const Icon(
                              Icons.add_circle_outline,
                              color: Colors.grey,
                              size: 20,
                            ),
                        ],
                      ),
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
              icon: const Icon(Icons.table_bar, color: Colors.white),
              label: const Text(
                'Add New Table/Event Order',
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
