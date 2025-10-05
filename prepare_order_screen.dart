import 'package:flutter/material.dart';

class PrepareOrderScreen extends StatelessWidget {
  const PrepareOrderScreen({super.key});
  final List<Map<String, dynamic>> kitchenQueue = const [
    {
      'orderId': 'T-001',
      'item': 'Chicken Tandoori',
      'time': 5,
      'priority': true,
    },
    {'orderId': 'T-002', 'item': 'Masala Dosa', 'time': 8, 'priority': false},
    {'orderId': 'T-001', 'item': 'Naan Basket', 'time': 3, 'priority': true},
    {'orderId': 'T-003', 'item': 'Veg Korma', 'time': 12, 'priority': false},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Kitchen Cooking Queue', style: theme.textTheme.titleLarge),
          const SizedBox(height: 16),

          Expanded(
            child: ListView.builder(
              itemCount: kitchenQueue.length,
              itemBuilder: (context, index) {
                final item = kitchenQueue[index];
                Color priorityColor = item['priority']
                    ? Colors.red
                    : Colors.grey;

                return Card(
                  color: theme.cardColor,
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.timer_outlined,
                      color: theme.primaryColor,
                    ),
                    title: Text(
                      '${item['item']} (Order ${item['orderId']})',
                      style: theme.textTheme.labelLarge,
                    ),
                    subtitle: Text('Est. Cook Time: ${item['time']} mins'),
                    trailing: item['priority']
                        ? Icon(Icons.star, color: priorityColor)
                        : null,
                    onTap: () {},
                  ),
                );
              },
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.check_circle_outline, color: Colors.white),
              label: const Text(
                'View Dispatch Window',
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
