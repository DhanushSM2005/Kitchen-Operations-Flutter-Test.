import 'package:flutter/material.dart';

class PreparedItemsScreen extends StatelessWidget {
  const PreparedItemsScreen({super.key});
  final List<Map<String, dynamic>> preparedItems = const [
    {
      'batchId': 'B-4501',
      'item': 'Butter Chicken (500g)',
      'prepTime': '15:30',
      'expiry': '08:00 AM',
      'preparedBy': 'Rahul K.',
      'status': 'Ready for Dispatch',
    },
    {
      'batchId': 'B-4502',
      'item': 'Beef Steak (100g)',
      'prepTime': '14:00',
      'expiry': '07:30 AM',
      'preparedBy': 'Salman',
      'status': 'Awaiting QC',
    },
    {
      'batchId': 'B-4503',
      'item': 'Beef Steak (200g)',
      'prepTime': '13:00',
      'expiry': '08:30 AM',
      'preparedBy': 'Gotham',
      'status': 'Awaiting QC',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Daily Prepared Batches',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: preparedItems.length,
            itemBuilder: (context, index) {
              return PreparedItemCard(item: preparedItems[index]);
            },
          ),
        ),
      ],
    );
  }
}

class PreparedItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  const PreparedItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color statusColor = Colors.orange;
    if (item['status'] == 'Ready for Dispatch') {
      statusColor = theme.primaryColor;
    } else if (item['status'] == 'Awaiting QC') {
      statusColor = Colors.yellow.shade700;
    }

    return Card(
      color: theme.cardColor,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Batch ID: ${item['batchId']}',
                  style: theme.textTheme.labelLarge,
                ),
                _buildStatusPill(theme, item['status'] as String, statusColor),
              ],
            ),
            const Divider(height: 20, color: Color(0xFF333333)),

            _buildDetailRow(context, 'Item', item['item'] as String),
            _buildDetailRow(
              context,
              'Prepared By',
              item['preparedBy'] as String,
            ),
            _buildDetailRow(
              context,
              'Time Prepared',
              item['prepTime'] as String,
            ),
            _buildDetailRow(
              context,
              'Shelf Expiry',
              item['expiry'] as String,
              color: Colors.red,
            ),

            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('Move to Dispatch'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String label,
    String value, {
    Color? color,
  }) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: theme.textTheme.bodyMedium),
          Text(value, style: theme.textTheme.bodyLarge?.copyWith(color: color)),
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
