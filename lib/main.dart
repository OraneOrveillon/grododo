import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grododo/view/theme.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'model/alarm.dart';
import 'model/sleep.dart';
import 'view/pages/navbar.dart';
import 'viewmodel/theme_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory directory = await getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(TimeOfDayAdapter())
    ..registerAdapter(AlarmAdapter())
    ..registerAdapter(RepetitionAdapter())
    ..registerAdapter(SleepAdapter());

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
