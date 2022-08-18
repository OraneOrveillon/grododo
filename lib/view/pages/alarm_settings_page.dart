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
              _buildSetting(
                context: context,
                title: 'Time',
                subtitle: alarmModel.alarm.time.format(context),
                leading: const Icon(Icons.access_time_outlined),
                onTap: () => _selectTime(
                  context: context,
                  alarmModel: alarmModel,
                ),
              ),
              _buildSetting(
                context: context,
                title: 'Repetition',
                subtitle: '${alarmModel.alarm.repetition}',
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
              _buildSetting(
                context: context,
                title: 'Duration',
                subtitle: '${alarmModel.alarm.duration}',
                leading: const Icon(Icons.timer),
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => ChangeNotifierProvider<AlarmModel>.value(
                    value: alarmModel,
                    child: _selectDuration(context: context),
                  ),
                ),
              ),
              _buildSetting(
                context: context,
                title: 'Fade',
                leading: const Icon(Icons.volume_down),
                trailing: Switch(
                  value: alarmModel.alarm.fade,
                  onChanged: (value) => alarmModel.updateFade(value),
                ),
              ),
              _buildSetting(
                context: context,
                title: 'Vibrator',
                leading: const Icon(Icons.vibration),
                trailing: Switch(
                  value: alarmModel.alarm.vibrator,
                  onChanged: (value) => alarmModel.updateVibrator(value),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSetting({
    required BuildContext context,
    required String title,
    String? subtitle,
    required Widget leading,
    Widget? trailing,
    Function()? onTap,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      leading: leading,
      trailing: trailing,
      onTap: onTap,
    );
  }

  void _selectTime({required BuildContext context, required AlarmModel alarmModel}) async {
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
              _buildRepetitionDay(
                context: context,
                value: repetition.monday,
                day: 'Monday',
                onChanged: (value) {
                  repetition.monday = value!;
                  alarmModel.updateRepetition(repetition);
                },
              ),
              _buildRepetitionDay(
                context: context,
                value: repetition.tuesday,
                day: 'Tuesday',
                onChanged: (value) {
                  repetition.tuesday = value!;
                  alarmModel.updateRepetition(repetition);
                },
              ),
              _buildRepetitionDay(
                context: context,
                value: repetition.wednesday,
                day: 'Wednesday',
                onChanged: (value) {
                  repetition.wednesday = value!;
                  alarmModel.updateRepetition(repetition);
                },
              ),
              _buildRepetitionDay(
                context: context,
                value: repetition.thursday,
                day: 'Thursday',
                onChanged: (value) {
                  repetition.thursday = value!;
                  alarmModel.updateRepetition(repetition);
                },
              ),
              _buildRepetitionDay(
                context: context,
                value: repetition.friday,
                day: 'Friday',
                onChanged: (value) {
                  repetition.friday = value!;
                  alarmModel.updateRepetition(repetition);
                },
              ),
              _buildRepetitionDay(
                context: context,
                value: repetition.saturday,
                day: 'Saturday',
                onChanged: (value) {
                  repetition.saturday = value!;
                  alarmModel.updateRepetition(repetition);
                },
              ),
              _buildRepetitionDay(
                context: context,
                value: repetition.sunday,
                day: 'Sunday',
                onChanged: (value) {
                  repetition.sunday = value!;
                  alarmModel.updateRepetition(repetition);
                },
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

  Widget _buildRepetitionDay({
    required BuildContext context,
    required bool value,
    required String day,
    required Function(bool?) onChanged,
  }) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Text(day),
      ],
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
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'CANCEL',
                style: TextStyle(color: Colors.black),
              ),
            ),
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
