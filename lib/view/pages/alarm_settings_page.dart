import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:provider/provider.dart';

import '../../model/alarm.dart';
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
          builder: (context, alarmModel, child) => Column(
            children: [
              ListTile(
                title: const Text('Time'),
                subtitle: Text(alarmModel.alarm.time.format(context)),
                leading: const Icon(Icons.access_time_outlined),
                onTap: () => _selectTime(
                  context: context,
                  alarmModel: alarmModel,
                ),
              ),
              ListTile(
                title: const Text('Repetition'),
                subtitle: Text(alarmModel.alarm.repetition.toString()),
                leading: const Icon(Icons.repeat),
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => ChangeNotifierProvider<AlarmModel>.value(
                    value: alarmModel,
                    child: _selectRepetition(
                      context: context,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: const Text('Duration'),
                subtitle: Text('${alarmModel.alarm.duration}'),
                leading: const Icon(Icons.timer),
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => ChangeNotifierProvider<AlarmModel>.value(
                    value: alarmModel,
                    child: _selectDuration(context: context),
                  ),
                ),
              ),
              ListTile(
                title: const Text('Fade'),
                leading: const Icon(Icons.volume_down),
                trailing: Switch(value: alarmModel.alarm.fade, onChanged: (value) {}),
              ),
              ListTile(
                title: const Text('Vibrator'),
                leading: const Icon(Icons.vibration),
                trailing: Switch(value: alarmModel.alarm.vibrator, onChanged: (value) {}),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _selectTime({required BuildContext context, required AlarmModel alarmModel}) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: alarmModel.alarm.time,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (newTime != null && newTime != alarmModel.alarm.time) {
      alarmModel.updateTime(newTime);
    }
  }

  Widget _selectRepetition({required BuildContext context}) {
    return Consumer<AlarmModel>(
      builder: (context, alarmModel, child) {
        Repetition repetition = alarmModel.alarm.repetition;
        return AlertDialog(
          title: const Text('Repetition'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: repetition.monday,
                    onChanged: (value) {
                      repetition.monday = value!;
                      alarmModel.updateRepetition(repetition);
                    },
                  ),
                  const Text('Monday'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: repetition.tuesday,
                    onChanged: (value) {
                      repetition.tuesday = value!;
                      alarmModel.updateRepetition(repetition);
                    },
                  ),
                  const Text('Tuesday'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: repetition.wednesday,
                    onChanged: (value) {
                      repetition.wednesday = value!;
                      alarmModel.updateRepetition(repetition);
                    },
                  ),
                  const Text('Wednesday'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: repetition.thursday,
                    onChanged: (value) {
                      repetition.thursday = value!;
                      alarmModel.updateRepetition(repetition);
                    },
                  ),
                  const Text('Thursday'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: repetition.friday,
                    onChanged: (value) {
                      repetition.friday = value!;
                      alarmModel.updateRepetition(repetition);
                    },
                  ),
                  const Text('Friday'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: repetition.saturday,
                    onChanged: (value) {
                      repetition.saturday = value!;
                      alarmModel.updateRepetition(repetition);
                    },
                  ),
                  const Text('Saturday'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: repetition.sunday,
                    onChanged: (value) {
                      repetition.sunday = value!;
                      alarmModel.updateRepetition(repetition);
                    },
                  ),
                  const Text('Sunday'),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
              child: const Text('CANCEL'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
              child: const Text('OK'),
              onPressed: () {
                // alarmModel.alarm.repetition =
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _selectDuration({required BuildContext context}) {
    return Consumer<AlarmModel>(
      builder: (context, alarmModel, child) {
        double value = alarmModel.alarm.duration.toDouble();
        return AlertDialog(
          title: const Text('Duration'),
          content: SpinBox(
            min: 5,
            max: 60,
            value: value,
            step: 5,
            onChanged: (newValue) => value = newValue,
          ),
          actions: [
            TextButton(
              onPressed: () {
                alarmModel.updateDuration(value.toInt());
                Navigator.pop(context);
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }
}
