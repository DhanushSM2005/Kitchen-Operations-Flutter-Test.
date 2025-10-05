import 'package:flutter/material.dart';

class ShelfLifeItem {
  final String itemId;
  final String itemName;
  final String itemType;
  final String preservationMethod;
  final String storageLocation;
  final String totalAvailableQuantity;
  final String daysLeftToShelfLife;
  final String available;

  ShelfLifeItem({
    required this.itemId,
    required this.itemName,
    required this.itemType,
    required this.preservationMethod,
    required this.storageLocation,
    required this.totalAvailableQuantity,
    required this.daysLeftToShelfLife,
    required this.available,
  });
}

final List<ShelfLifeItem> mockShelfLifeItems = [
  ShelfLifeItem(
    itemId: 'IN01',
    itemName: 'Tomato',
    itemType: 'Vegetables',
    preservationMethod: 'Refrigerator',
    storageLocation: 'Location 1',
    totalAvailableQuantity: '8 kg',
    daysLeftToShelfLife: '2 Days',
    available: '2 kg',
  ),
  ShelfLifeItem(
    itemId: 'IN02',
    itemName: 'Cheese',
    itemType: 'Dairy',
    preservationMethod: 'Deep Freeze',
    storageLocation: 'Location 2',
    totalAvailableQuantity: '5 kg',
    daysLeftToShelfLife: '3 Days',
    available: '3 kg',
  ),
  ShelfLifeItem(
    itemId: 'IN03',
    itemName: 'Rice',
    itemType: 'Grocery',
    preservationMethod: 'Dry',
    storageLocation: 'Location 1',
    totalAvailableQuantity: '20 kg',
    daysLeftToShelfLife: '5 Days',
    available: '5 kg',
  ),
  ShelfLifeItem(
    itemId: 'IN04',
    itemName: 'Tomato',
    itemType: 'Vegetables',
    preservationMethod: 'Refrigerator',
    storageLocation: 'Location 2',
    totalAvailableQuantity: '8 kg',
    daysLeftToShelfLife: '6 Days',
    available: '7 kg',
  ),
  ShelfLifeItem(
    itemId: 'IN05',
    itemName: 'Tomato',
    itemType: 'Vegetables',
    preservationMethod: 'Refrigerator',
    storageLocation: 'Location 1',
    totalAvailableQuantity: '8 kg',
    daysLeftToShelfLife: '2 Days',
    available: '4 kg',
  ),
  ShelfLifeItem(
    itemId: 'IN06',
    itemName: 'Tomato',
    itemType: 'Vegetables',
    preservationMethod: 'Refrigerator',
    storageLocation: 'Location 2',
    totalAvailableQuantity: '8 kg',
    daysLeftToShelfLife: '2 Days',
    available: '7 kg',
  ),
];

class ShelfLifeScreen extends StatelessWidget {
  const ShelfLifeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const double columnWidth = 140.0;
    const double actionWidth = 300.0;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: theme.brightness == Brightness.dark
                ? const Color(0xFF1E1E1E)
                : Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.grey.shade700, width: 0.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTableHeader(theme, columnWidth, actionWidth),
              const Divider(height: 1, thickness: 1),
              ...mockShelfLifeItems.map((item) {
                final isUrgent =
                    item.daysLeftToShelfLife.contains('2 Days') ||
                    item.daysLeftToShelfLife.contains('3 Days');
                return _buildTableRow(
                  context,
                  theme,
                  item,
                  columnWidth,
                  actionWidth,
                  isUrgent,
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTableHeader(
    ThemeData theme,
    double columnWidth,
    double actionWidth,
  ) {
    TextStyle headerStyle = theme.textTheme.titleSmall!.copyWith(
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.onSurface.withOpacity(0.7),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Row(
        children: [
          _buildHeaderCell('Item ID', columnWidth, headerStyle),
          _buildHeaderCell('Item Name', columnWidth, headerStyle),
          _buildHeaderCell('Item Type', columnWidth, headerStyle),
          _buildHeaderCell('Preservation Method', columnWidth, headerStyle),
          _buildHeaderCell('Storage Location', columnWidth, headerStyle),
          _buildHeaderCell(
            'Total Available Quantity',
            columnWidth,
            headerStyle,
          ),
          _buildHeaderCell('Days Left To Shelf Life', columnWidth, headerStyle),
          _buildHeaderCell('Available', columnWidth, headerStyle),
          SizedBox(
            width: actionWidth,
            child: Text('Action', style: headerStyle),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String text, double width, TextStyle style) {
    return SizedBox(
      width: width,
      child: Text(text, style: style),
    );
  }

  Widget _buildTableRow(
    BuildContext context,
    ThemeData theme,
    ShelfLifeItem item,
    double columnWidth,
    double actionWidth,
    bool isUrgent,
  ) {
    TextStyle cellStyle = theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.onSurface.withOpacity(0.9),
    );

    TextStyle urgentDaysStyle = cellStyle.copyWith(
      color: Colors.red,
      fontWeight: FontWeight.bold,
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1.0),
        ),
      ),
      child: Row(
        children: [
          _buildTableCell(item.itemId, columnWidth, cellStyle),
          _buildTableCell(item.itemName, columnWidth, cellStyle),
          _buildTableCell(item.itemType, columnWidth, cellStyle),
          _buildTableCell(item.preservationMethod, columnWidth, cellStyle),
          _buildTableCell(item.storageLocation, columnWidth, cellStyle),
          _buildTableCell(item.totalAvailableQuantity, columnWidth, cellStyle),
          _buildTableCell(
            item.daysLeftToShelfLife,
            columnWidth,
            isUrgent ? urgentDaysStyle : cellStyle,
          ),
          _buildTableCell(item.available, columnWidth, cellStyle),
          SizedBox(
            width: actionWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildActionButton(
                    context,
                    'Set Discount Offer',
                    theme.colorScheme.onPrimary,
                    theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: _buildActionButton(
                    context,
                    'Remove From Watchlist',
                    theme.colorScheme.onSurface,
                    theme.colorScheme.surface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableCell(String text, double width, TextStyle style) {
    return SizedBox(
      width: width,
      child: Text(text, style: style),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String text,
    Color foregroundColor,
    Color backgroundColor,
  ) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: backgroundColor == Theme.of(context).colorScheme.surface
              ? BorderSide(color: Theme.of(context).colorScheme.outline)
              : BorderSide.none,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
        minimumSize: const Size(0, 30),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 10),
      ),
    );
  }
}
