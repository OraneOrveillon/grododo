import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../model/alarm.dart';
import '../../viewmodel/navbar_index_model.dart';
import '../components/background.dart';
import '../size_config.dart';
import 'alarms_page.dart';
import 'settings_page.dart';
import 'sleep_page.dart';
import 'stats_page.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key, required Box<Alarm> box}) : super(key: key) {
    _navPages = [
      AlarmsPage(box: box),
      const SleepPage(),
      const StatsPage(),
      const SettingsPage(),
    ];
  }

  late final List<Widget> _navPages;

  final List<String> _labels = ['Alarms', 'Sleep', 'Statistics', 'Settings'];

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);
    return ChangeNotifierProvider(
      create: (_) => NavigationBarIndexModel(initialIndex: 1),
      child: Consumer<NavigationBarIndexModel>(
        builder: (context, indexModel, child) => Scaffold(
          extendBody: true,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.2),
                  width: 1,
                ),
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: indexModel.index,
              onTap: (index) => indexModel.updateIndex(newIndex: index),
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(
                        top: sizeConfig.blockSizeVertical * 0.5),
                    child:
                        const ImageIcon(AssetImage('assets/icons/alarm.png')),
                  ),
                  label: _labels[0],
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(
                        top: sizeConfig.blockSizeVertical * 0.5),
                    child: const ImageIcon(AssetImage('assets/icons/moon.png')),
                  ),
                  label: _labels[1],
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(
                        top: sizeConfig.blockSizeVertical * 0.5),
                    child:
                        const ImageIcon(AssetImage('assets/icons/stats.png')),
                  ),
                  label: _labels[2],
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(
                        top: sizeConfig.blockSizeVertical * 0.5),
                    child: const ImageIcon(
                        AssetImage('assets/icons/settings.png')),
                  ),
                  label: _labels[3],
                ),
              ],
            ),
          ),
          body: Background(
            child: _navPages[indexModel.index],
          ),
        ),
      ),
    );
  }
}
