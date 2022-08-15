import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';

class SleepPage extends StatelessWidget {
  const SleepPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ThemeModel>(
              builder: (context, themeModel, child) => ElevatedButton(
                  onPressed: () => themeModel.changeTheme(), child: const Text('Changer de theme')))
        ],
      ),
    );
  }
}
