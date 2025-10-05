import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_themes.dart';
import 'schedule_screen.dart';
import 'live_orders_screen.dart';
import 'shelf_life_screen.dart';
import 'prepared_items_screen.dart';
import 'leftover_screen.dart';
import 'purchase_confirmation_screen.dart';
import 'current_stock_screen.dart';
import 'dashboard_main_screen.dart';
import 'take_orders_screen.dart';
import 'prepare_order_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentBottomIndex = 3;
  final List<String> _topTabs = [
    'Schedule',
    'Live Orders',
    'Shelf Life Items',
    'Prepared Items',
    'Leftover',
    'Purchase Confirmation',
    'Current Stock',
  ];
  static const double _kBannerHeight = 35.0;
  static const Color _kBannerColor = Color(0xFF00A884);
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _topTabs.length,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _getKitchenOperationTabContent(int index) {
    switch (_topTabs[index]) {
      case 'Schedule':
        return const ScheduleScreen();
      case 'Live Orders':
        return const LiveOrdersScreen();
      case 'Shelf Life Items':
        return const ShelfLifeScreen();
      case 'Prepared Items':
        return const PreparedItemsScreen();
      case 'Leftover':
        return const LeftoverScreen();
      case 'Purchase Confirmation':
        return const PurchaseConfirmationScreen();
      case 'Current Stock':
        return const CurrentStockScreen();
      default:
        return Center(child: Text('${_topTabs[index]} Placeholder Screen'));
    }
  }

  Widget _getMainScreenContent(int index) {
    switch (index) {
      case 0:
        return const DashboardMainScreen();
      case 1:
        return const TakeOrdersScreen();
      case 2:
        return const PrepareOrderScreen();
      case 3:
        return TabBarView(
          controller: _tabController,
          children: List.generate(
            _topTabs.length,
            (index) => _getKitchenOperationTabContent(index),
          ),
        );
      default:
        return const Center(child: Text('Unknown Screen'));
    }
  }

  Widget _buildTopHeaderBanner(BuildContext context) {
    return Container(
      height: _kBannerHeight,
      width: double.infinity,
      color: _kBannerColor,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 16.0),
      child: const Text(
        'Test Screens',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final theme = Theme.of(context);
    String title = '';
    PreferredSizeWidget? bottomWidget;

    if (_currentBottomIndex == 3) {
      title = 'Kitchen Operations';
      bottomWidget = PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.zero,
              tabs: List.generate(_topTabs.length, (index) {
                return Tab(
                  child: AnimatedBuilder(
                    animation: _tabController,
                    builder: (context, child) {
                      final isSelected = _tabController.index == index;
                      return _buildCustomTab(_topTabs[index], isSelected);
                    },
                  ),
                );
              }),
            ),
          ),
        ),
      );
    } else if (_currentBottomIndex == 0) {
      title = 'Main Dashboard';
    } else if (_currentBottomIndex == 1) {
      title = 'Take Orders';
    } else if (_currentBottomIndex == 2) {
      title = 'Prepare Order';
    }

    double totalHeight = kToolbarHeight + _kBannerHeight;
    if (_currentBottomIndex == 3) {
      totalHeight += 60.0;
    }
    return PreferredSize(
      preferredSize: Size.fromHeight(totalHeight),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTopHeaderBanner(context),
          Flexible(
            child: AppBar(
              toolbarHeight: kToolbarHeight,
              title: Text(title, style: theme.textTheme.titleLarge),
              automaticallyImplyLeading: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.brightness_4),
                  onPressed: () {
                    Provider.of<ThemeProvider>(
                      context,
                      listen: false,
                    ).toggleTheme();
                  },
                ),
              ],
              bottom: bottomWidget,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomTab(String title, bool isSelected) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: isSelected ? theme.primaryColor : theme.cardColor,
        border: Border.all(
          color: isSelected
              ? theme.primaryColor
              : (theme.brightness == Brightness.dark
                    ? Colors.grey.shade700
                    : Colors.grey.shade300),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : theme.textTheme.bodyMedium?.color,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context),
      appBar: _buildAppBar(context),
      body: _getMainScreenContent(_currentBottomIndex),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    final theme = Theme.of(context);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: theme.scaffoldBackgroundColor,
      selectedItemColor: theme.primaryColor,
      unselectedItemColor: theme.textTheme.bodyLarge?.color,
      showUnselectedLabels: true,
      currentIndex: _currentBottomIndex,
      onTap: (index) {
        setState(() {
          _currentBottomIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_outlined),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: 'Take Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_dining_outlined),
          label: 'Prepare Order',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.kitchen_outlined),
          label: 'Kitchen Operation',
        ),
      ],
    );
  }

  Widget _buildDrawer(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      backgroundColor: theme.scaffoldBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: theme.primaryColor),
            child: const Text(
              'Sidebar Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            title: Text('Reports', style: theme.textTheme.bodyLarge),
            leading: Icon(Icons.analytics_outlined, color: theme.primaryColor),
            onTap: () {},
          ),
          ListTile(
            title: Text('Settings', style: theme.textTheme.bodyLarge),
            leading: Icon(Icons.settings_outlined, color: theme.primaryColor),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
