import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/app_themes.dart';
import 'views/dashboard_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const KitchenOperationsApp(),
    ),
  );
}

class KitchenOperationsApp extends StatelessWidget {
  const KitchenOperationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kitchen Operations',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeProvider.themeMode,
      home: const DashboardScreen(),
    );
  }
}
