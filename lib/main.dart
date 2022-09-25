import 'package:flutter/material.dart';
import 'package:grododo/view/theme.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'model/alarm.dart';
import 'model/sleep.dart';
import 'view/pages/navbar.dart';
import 'viewmodel/theme_model.dart';

void main() {
  Hive.registerAdapter(AlarmAdapter());
  Hive.registerAdapter(SleepAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
        builder: (context, themeModel, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Grododo',
          theme: themeData(context),
          darkTheme: darkThemeData(context),
          themeMode: themeModel.isLightTheme ? ThemeMode.light : ThemeMode.dark,
          home: NavBar(),
        ),
      ),
    );
  }
}
