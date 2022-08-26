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

  final List<String> _labels = ['Alarms', 'Sleep', 'Statistics', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationBarIndexModel(initialIndex: 1),
      child: Consumer<NavigationBarIndexModel>(
        builder: (context, indexModel, child) => Scaffold(
          appBar: AppBar(
            title: Text(_labels[indexModel.index]),
          ),
          extendBody: true,
          extendBodyBehindAppBar: true,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: indexModel.index,
            onTap: (index) => indexModel.updateIndex(newIndex: index),
            items: [
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage('assets/icons/alarm.png')),
                label: _labels[0],
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage('assets/icons/moon.png')),
                label: _labels[1],
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage('assets/icons/stats.png')),
                label: _labels[2],
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage('assets/icons/settings.png')),
                label: _labels[3],
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
