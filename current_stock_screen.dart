import 'package:flutter/material.dart';

class CurrentStockScreen extends StatelessWidget {
  const CurrentStockScreen({super.key});
  final List<Map<String, dynamic>> stockItems = const [
    {'item': 'Chicken Breast', 'qty': '50 kg', 'unit': 'kg', 'status': 'Good'},
    {
      'item': 'Flour (Maida)',
      'qty': '100 kg',
      'unit': 'kg',
      'status': 'Low Stock',
    },
    {'item': 'Milk (Full Cream)', 'qty': '20 L', 'unit': 'L', 'status': 'Good'},
    {'item': 'Eggs', 'qty': '10 Dozen', 'unit': 'Dozen', 'status': 'Critical'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Current Stock Inventory', style: theme.textTheme.titleLarge),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 1.5,
              ),
              itemCount: stockItems.length,
              itemBuilder: (context, index) {
                final item = stockItems[index];
                Color statusColor = theme.primaryColor; // Good
                if (item['status'] == 'Low Stock') {
                  statusColor = Colors.orange;
                } else if (item['status'] == 'Critical') {
                  statusColor = Colors.red;
                }

                return Card(
                  color: theme.cardColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['item'] as String,
                          style: theme.textTheme.labelLarge,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Quantity:',
                              style: theme.textTheme.bodyMedium,
                            ),
                            Text(
                              '${item['qty']} ${item['unit']}',
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontSize: 20,
                                color: statusColor,
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
          ),
        ],
      ),
    );
  }
}
