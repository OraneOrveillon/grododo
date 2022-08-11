import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/alarm_model.dart';
import '../components/background_gradient.dart';

class AlarmSettingsPage extends StatelessWidget {
  const AlarmSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm settings'),
      ),
      body: BackgroundGradient(
        child: Consumer<AlarmModel>(
          builder: (context, alarmProvider, child) => Column(
            children: [
              ListTile(
                title: const Text('Time'),
                subtitle: Text(alarmProvider.alarm.time),
                leading: const Icon(Icons.access_time_outlined),
              ),
              ListTile(
                title: const Text('Repetition'),
                subtitle: Text(alarmProvider.alarm.repetition.join(' ,')),
                leading: const Icon(Icons.repeat),
              ),
              ListTile(
                title: const Text('Duration'),
                subtitle: Text('${alarmProvider.alarm.duration}'),
                leading: const Icon(Icons.timer),
              ),
              ListTile(
                title: const Text('Fade'),
                leading: const Icon(Icons.volume_down),
                trailing: Switch(value: alarmProvider.alarm.fade, onChanged: (value) {}),
              ),
              ListTile(
                title: const Text('Vibrator'),
                leading: const Icon(Icons.vibration),
                trailing: Switch(value: alarmProvider.alarm.vibrator, onChanged: (value) {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
