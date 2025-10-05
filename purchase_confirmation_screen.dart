import 'package:flutter/material.dart';

class PurchaseConfirmationScreen extends StatelessWidget {
  const PurchaseConfirmationScreen({super.key});
  final List<Map<String, dynamic>> purchaseOrders = const [
    {
      'orderId': 'PO-9001',
      'supplier': 'Farm Fresh Inc.',
      'total': '₹5,500',
      'status': 'Pending Confirmation',
    },
    {
      'orderId': 'PO-9002',
      'supplier': 'Spice Hub',
      'total': '₹1,200',
      'status': 'Confirmed',
    },
    {
      'orderId': 'PO-8999',
      'supplier': 'Meat Delivers',
      'total': '₹12,450',
      'status': 'Delivered',
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
          Text('Pending Purchase Orders', style: theme.textTheme.titleLarge),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: purchaseOrders.length,
              itemBuilder: (context, index) {
                final order = purchaseOrders[index];
                Color statusColor = Colors.orange;
                if (order['status'] == 'Confirmed') {
                  statusColor = theme.primaryColor;
                } else if (order['status'] == 'Delivered') {
                  statusColor = Colors.blue;
                }

                return Card(
                  color: theme.cardColor,
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    title: Text(
                      '${order['orderId']} - ${order['supplier']}',
                      style: theme.textTheme.labelLarge,
                    ),
                    subtitle: Text(
                      'Total: ${order['total']}',
                      style: theme.textTheme.bodyMedium,
                    ),
                    trailing: _buildStatusPill(
                      theme,
                      order['status'] as String,
                      statusColor,
                    ),
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusPill(ThemeData theme, String status, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
