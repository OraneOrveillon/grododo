import 'package:flutter/material.dart';
import 'package:grododo/theme.dart';
import 'package:provider/provider.dart';

import '../model/theme_provider.dart';
import 'model/navbar_index_provider.dart';
import 'view/pages/alarms_page.dart';
import 'view/pages/settings_page.dart';
import 'view/pages/sleep_page.dart';
import 'view/pages/stats_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, theme, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Grododo',
          theme: themeData(context),
          darkTheme: darkThemeData(context),
          themeMode: theme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
          home: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Widget> _navPages = [
    const AlarmsPage(),
    const SleepPage(),
    const StatsPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationBarIndexProvider(initialIndex: 1),
      child: Consumer<NavigationBarIndexProvider>(
        builder: (context, indexProvider, child) => Scaffold(
          extendBody: true,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: indexProvider.index,
            onTap: (index) => indexProvider.updateIndex(newIndex: index),
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/alarm.png')),
                label: 'Alarms',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/moon.png')),
                label: 'Sleep',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/stats.png')),
                label: 'Stats',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/settings.png')),
                label: 'Settings',
              ),
            ],
          ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color(0xFF021228),
                ],
                // stops: [0, 1],
              ),
            ),
            child: _navPages[indexProvider.index],
          ),
        ),
      ),
    );
  }
}
