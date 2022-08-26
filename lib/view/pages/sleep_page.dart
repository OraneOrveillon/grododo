import 'package:flutter/material.dart';

class SleepPage extends StatelessWidget {
  const SleepPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('I am going to bed'),
        onPressed: () {},
      ),
    );
  }
}
