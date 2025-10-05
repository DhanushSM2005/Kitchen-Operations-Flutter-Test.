import 'package:flutter/material.dart';

class OrderItem {
  final String name;
  final String quantity;
  final String assigned;
  final String status;
  final bool canAssign;

  OrderItem({
    required this.name,
    required this.quantity,
    required this.assigned,
    required this.status,
    this.canAssign = false,
  });
}

class Order {
  final String id;
  final String room;
  final String status;
  final String timer;
  final List<OrderItem> items;

  Order({
    required this.id,
    required this.room,
    required this.status,
    required this.timer,
    required this.items,
  });
}

final List<Order> mockOrders = [
  Order(
    id: '10098',
    room: 'A-101',
    status: 'Prepiring',
    timer: '29:38',
    items: [
      OrderItem(
        name: 'Butter Chicken',
        quantity: '2 x 500g',
        assigned: 'Rahul K.',
        status: 'Prepared',
      ),
      OrderItem(
        name: 'Butter Chicken',
        quantity: '2 x 500g',
        assigned: 'Rahul K.',
        status: 'Prepared',
      ),
      OrderItem(
        name: 'Butter Chicken',
        quantity: '2 x 500g',
        assigned: 'Assign',
        status: 'Prepared',
        canAssign: true,
      ),
    ],
  ),
  Order(
    id: '10098',
    room: 'A-101',
    status: 'Prepiring',
    timer: '29:38',
    items: [
      OrderItem(
        name: 'Butter Chicken',
        quantity: '2 x 500g',
        assigned: 'Rahul K.',
        status: 'Prepared',
      ),
    ],
  ),
  Order(
    id: '10098',
    room: 'A-101',
    status: 'Prepiring',
    timer: '29:38',
    items: [
      OrderItem(
        name: 'Butter Chicken',
        quantity: '2 x 500g',
        assigned: 'Rahul K.',
        status: 'Prepared',
      ),
    ],
  ),
  Order(
    id: '10098',
    room: 'A-101',
    status: 'Prepiring',
    timer: '29:38',
    items: [
      OrderItem(
        name: 'Butter Chicken',
        quantity: '2 x 500g',
        assigned: 'Rahul K.',
        status: 'Prepared',
      ),
    ],
  ),
];

class MenuItem {
  final String name;
  final String initialAvailableQuantity;
  final String initialRequiredQuantity;
  final String availableUnit;
  final String requiredUnit;
  final String updatedBy;

  MenuItem({
    required this.name,
    this.initialAvailableQuantity = '0',
    this.initialRequiredQuantity = '0',
    this.availableUnit = 'kg',
    this.requiredUnit = 'kg',
    this.updatedBy = '--',
  });
}

final List<MenuItem> mockMenuItems = [
  MenuItem(
    name: 'Beef Steak',
    initialAvailableQuantity: '100',
    availableUnit: 'kg',
    initialRequiredQuantity: '50',
    updatedBy: 'Rahul K.',
  ),
  MenuItem(
    name: 'Paneer Tikka',
    initialAvailableQuantity: '--',
    availableUnit: 'Pieces',
    initialRequiredQuantity: '50',
    requiredUnit: 'Pieces',
    updatedBy: 'Salman',
  ),
  MenuItem(
    name: 'Beef Steak',
    initialAvailableQuantity: '100',
    availableUnit: 'kg',
    initialRequiredQuantity: '50',
    updatedBy: '--',
  ),
  MenuItem(
    name: 'Paneer Tikka',
    initialAvailableQuantity: '50',
    availableUnit: 'kg',
    initialRequiredQuantity: '50',
    requiredUnit: 'Pieces',
    updatedBy: 'Salman',
  ),
];

class LiveOrdersScreen extends StatefulWidget {
  const LiveOrdersScreen({super.key});

  @override
  State<LiveOrdersScreen> createState() => _LiveOrdersScreenState();
}

class _LiveOrdersScreenState extends State<LiveOrdersScreen>
    with TickerProviderStateMixin {
  late TabController _mainTabController;
  late TabController _subTabController;
  bool _isAvailableEditing = false;

  @override
  void initState() {
    super.initState();
    _mainTabController = TabController(length: 2, vsync: this);
    _subTabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _mainTabController.dispose();
    _subTabController.dispose();
    super.dispose();
  }

  Widget _buildRunningOrdersTab(ThemeData theme) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: mockOrders.length,
      itemBuilder: (context, index) {
        final order = mockOrders[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: _buildOrderCard(theme, order),
        );
      },
    );
  }

  Widget _buildOrderCard(ThemeData theme, Order order) {
    Color cardColor = theme.brightness == Brightness.dark
        ? const Color(0xFF1E1E1E)
        : Colors.white;

    return Container(
      decoration: BoxDecoration(
        color: cardColor,
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
        children: [
          // Header Row
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 1.0,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHeaderColumn('Order Id', order.id, theme, isBold: true),
                _buildHeaderColumn('Room', order.room, theme, isBold: true),
                _buildHeaderColumn(
                  'Order Status',
                  order.status,
                  theme,
                  isBold: false,
                ),
                _buildHeaderColumn(
                  'Timer',
                  order.timer,
                  theme,
                  isBold: false,
                  isPrimaryColor: true,
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              ],
            ),
          ),

          ...order.items.asMap().entries.map((entry) {
            final item = entry.value;
            final isLast = entry.key == order.items.length - 1;
            return _buildItemRow(theme, item, isLast);
          }).toList(),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  child: Text(
                    order.items.length > 1 ? 'Cancel All' : 'Cancel Order',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderColumn(
    String title,
    String value,
    ThemeData theme, {
    required bool isBold,
    bool isPrimaryColor = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.5),
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: isPrimaryColor
                ? theme.colorScheme.primary
                : theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Widget _buildItemRow(ThemeData theme, OrderItem item, bool isLast) {
    Color textColor = theme.colorScheme.onSurface;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: isLast
              ? BorderSide.none
              : BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Item Name
          SizedBox(
            width: 80,
            child: Text(
              item.name,
              style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
            ),
          ),

          // Quantity
          SizedBox(
            width: 80,
            child: Text(
              item.quantity,
              style: TextStyle(color: textColor.withOpacity(0.7)),
            ),
          ),

          // Assigned
          SizedBox(
            width: 70,
            child: Text(
              item.assigned,
              style: TextStyle(
                color: item.canAssign ? theme.colorScheme.primary : textColor,
                fontWeight: item.canAssign
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),

          // Status
          Text(
            item.status,
            style: TextStyle(color: textColor.withOpacity(0.7)),
          ),

          // Action Button (Cancel)
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              minimumSize: const Size(0, 30),
            ),
            child: const Text('Cancel', style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildBreakfastMenuTab(ThemeData theme) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceVariant.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TabBar(
              controller: _subTabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: theme.colorScheme.primary,
              ),
              labelColor: theme.colorScheme.onPrimary,
              unselectedLabelColor: theme.colorScheme.onSurface,
              labelStyle: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              tabs: const [
                Tab(text: 'Prepare'),
                Tab(text: 'Available'),
                Tab(text: 'Required'),
              ],
            ),
          ),
        ),

        Expanded(
          child: TabBarView(
            controller: _subTabController,
            children: [
              _buildPrepareContent(theme),
              _buildAvailableContent(theme),
              _buildRequiredContent(theme),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPrepareContent(ThemeData theme) {
    return const Center(
      child: Text('Add items to Prepare list functionality here.'),
    );
  }

  Widget _buildAvailableContent(ThemeData theme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: theme.brightness == Brightness.dark
              ? const Color(0xFF1E1E1E)
              : Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.grey.shade700, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Breakfast Menu & Quantity',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Table Header
            Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Text(
                    'Item Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Available Quantity',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: Text(
                    'Updated by',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Divider(height: 20),

            // Table Rows
            ...mockMenuItems.map((item) => _buildAvailableRow(theme, item)),

            const SizedBox(height: 20),

            // Edit/Save Button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _isAvailableEditing = !_isAvailableEditing;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: theme.colorScheme.onSurface,
                    side: BorderSide(color: theme.colorScheme.outline),
                    backgroundColor: theme.colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  child: Text(_isAvailableEditing ? 'Save' : 'Edit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvailableRow(ThemeData theme, MenuItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 3, child: Text(item.name)),
          Expanded(
            flex: 2,
            child: _isAvailableEditing
                ? Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: TextEditingController(
                            text: item.initialAvailableQuantity != '--'
                                ? item.initialAvailableQuantity
                                : '',
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 8,
                            ),
                            border: const OutlineInputBorder(),
                            constraints: const BoxConstraints(maxHeight: 35),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(item.availableUnit),
                      ),
                    ],
                  )
                : Text(item.initialAvailableQuantity),
          ),
          Expanded(flex: 2, child: Text(item.updatedBy)),
        ],
      ),
    );
  }

  Widget _buildRequiredContent(ThemeData theme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: theme.brightness == Brightness.dark
              ? const Color(0xFF1E1E1E)
              : Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.grey.shade700, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Breakfast Menu & Quantity',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Text(
                    'Item Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Required Quantity',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: Text(
                    'Updated by',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            ...mockMenuItems.map((item) => _buildRequiredRow(theme, item)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequiredRow(ThemeData theme, MenuItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 3, child: Text(item.name)),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: TextEditingController(
                      text: item.initialRequiredQuantity,
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      border: const OutlineInputBorder(),
                      constraints: const BoxConstraints(maxHeight: 35),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(item.requiredUnit),
                ),
              ],
            ),
          ),
          Expanded(flex: 2, child: Text(item.updatedBy)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        // Internal Tab Bar (Running Orders / Ala Carte Menu)
        Container(
          height: 48,
          margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: TabBar(
            controller: _mainTabController,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 3.0,
              ),
              insets: const EdgeInsets.symmetric(horizontal: 8.0),
            ),
            labelColor: theme.colorScheme.primary,
            unselectedLabelColor: theme.colorScheme.onSurface.withOpacity(0.7),
            labelStyle: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: theme.textTheme.titleMedium,
            tabs: const [
              Tab(text: 'Runing Orders'),
              Tab(text: 'Ala Carte Menu'),
            ],
          ),
        ),

        Expanded(
          child: TabBarView(
            controller: _mainTabController,
            children: [
              _buildRunningOrdersTab(theme),
              _buildBreakfastMenuTab(theme),
            ],
          ),
        ),
      ],
    );
  }
}
