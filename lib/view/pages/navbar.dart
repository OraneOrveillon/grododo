import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/navbar_index_model.dart';
import '../components/background_gradient.dart';
import 'alarms_page.dart';
import 'settings_page.dart';
import 'sleep_page.dart';
import 'stats_page.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);

  final List<Widget> _navPages = [
    const AlarmsPage(),
    const SleepPage(),
    const StatsPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationBarIndexModel(initialIndex: 1),
      child: Consumer<NavigationBarIndexModel>(
        builder: (context, indexModel, child) => Scaffold(
          extendBody: true,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: indexModel.index,
            onTap: (index) => indexModel.updateIndex(newIndex: index),
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
          body: BackgroundGradient(
            child: _navPages[indexModel.index],
          ),
        ),
      ),
    );
  }
}
