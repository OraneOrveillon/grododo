import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:provider/provider.dart';

import '../../model/alarm.dart';
import '../../viewmodel/alarm_model.dart';
import '../../viewmodel/checkbox_model.dart';
import '../components/background.dart';
import '../components/dialog.dart';
import '../components/list_tile.dart';
import '../size_config.dart';

class AlarmSettingsPage extends StatelessWidget {
  const AlarmSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          'Alarm settings',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: sizeConfig.blockSizeVertical * 3.5,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Background(
        child: Consumer<AlarmModel>(
          builder: (context, alarmModel, child) => ListView(
            children: [
              _buildSetting(
                context: context,
                sizeConfig: sizeConfig,
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
                sizeConfig: sizeConfig,
                title: 'Repetition',
                subtitle: '${alarmModel.alarm.repetition}',
                leading: const Icon(Icons.repeat),
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => ChangeNotifierProvider<AlarmModel>.value(
                    value: alarmModel,
                    child: _selectRepetition(context: context, sizeConfig: sizeConfig),
                  ),
                ),
              ),
              _buildSetting(
                context: context,
                sizeConfig: sizeConfig,
                title: 'Duration',
                subtitle: '${alarmModel.alarm.duration} min',
                leading: const Icon(Icons.timer),
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => ChangeNotifierProvider<AlarmModel>.value(
                    value: alarmModel,
                    child: _selectDuration(context: context, sizeConfig: sizeConfig),
                  ),
                ),
              ),
              _buildSetting(
                context: context,
                sizeConfig: sizeConfig,
                title: 'Fade',
                leading: const Icon(Icons.volume_down),
                trailing: Switch(
                  value: alarmModel.alarm.fade,
                  onChanged: (value) => alarmModel.updateFade(value),
                ),
              ),
              _buildSetting(
                context: context,
                sizeConfig: sizeConfig,
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
    required SizeConfig sizeConfig,
    required String title,
    String? subtitle,
    required Widget leading,
    Widget? trailing,
    Function()? onTap,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        sizeConfig.blockSizeHorizontal * 3,
        0,
        sizeConfig.blockSizeHorizontal * 3,
        0,
      ),
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              leading,
              Expanded(
                child: CustomListTile(
                  titleText: title,
                  subtitleText: subtitle,
                ),
              ),
              trailing ?? Container(),
            ],
          ),
        ),
      ),
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

  Widget _selectRepetition({required BuildContext context, required SizeConfig sizeConfig}) {
    return Consumer<AlarmModel>(
      builder: (context, alarmModel, child) {
        Repetition repetition = alarmModel.alarm.repetition;
        List<RepetitionDay> days = [
          RepetitionDay(context: context, initialValue: repetition.monday, day: 'Monday'),
          RepetitionDay(context: context, initialValue: repetition.tuesday, day: 'Tuesday'),
          RepetitionDay(context: context, initialValue: repetition.wednesday, day: 'Wednesday'),
          RepetitionDay(context: context, initialValue: repetition.thursday, day: 'Thursday'),
          RepetitionDay(context: context, initialValue: repetition.friday, day: 'Friday'),
          RepetitionDay(context: context, initialValue: repetition.saturday, day: 'Saturday'),
          RepetitionDay(context: context, initialValue: repetition.sunday, day: 'Sunday'),
        ];
        return CustomDialog(
          sizeConfig: sizeConfig,
          titleText: 'Repetition',
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: days,
          ),
          onPressedOK: () => alarmModel.updateRepetition(Repetition(
            monday: days[0].checkboxModel.isChecked,
            tuesday: days[1].checkboxModel.isChecked,
            wednesday: days[2].checkboxModel.isChecked,
            thursday: days[3].checkboxModel.isChecked,
            friday: days[4].checkboxModel.isChecked,
            saturday: days[5].checkboxModel.isChecked,
            sunday: days[6].checkboxModel.isChecked,
          )),
        );
      },
    );
  }

  Widget _selectDuration({required BuildContext context, required SizeConfig sizeConfig}) {
    return Consumer<AlarmModel>(
      builder: (context, alarmModel, child) {
        double value = alarmModel.alarm.duration.toDouble();
        return CustomDialog(
          sizeConfig: sizeConfig,
          titleText: 'Duration (min)',
          content: SpinBox(
            min: 5,
            max: 60,
            value: value,
            step: 5,
            incrementIcon: Icon(
              Icons.add,
              color: Theme.of(context).iconTheme.color,
            ),
            decrementIcon: Icon(
              Icons.remove,
              color: Theme.of(context).iconTheme.color,
            ),
            textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: sizeConfig.blockSizeVertical * 3,
                ),
            onChanged: (newValue) => value = newValue,
          ),
          onPressedOK: () => alarmModel.updateDuration(value.toInt()),
        );
      },
    );
  }
}

class RepetitionDay extends StatelessWidget {
  RepetitionDay({Key? key, required this.context, required this.day, required bool initialValue})
      : super(key: key) {
    checkboxModel = CheckboxModel(isChecked: initialValue);
  }

  final BuildContext context;
  final String day;
  late final CheckboxModel checkboxModel;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: checkboxModel,
      child: Row(
        children: [
          Consumer<CheckboxModel>(
            builder: (context, checkboxModel, child) => Checkbox(
              value: checkboxModel.isChecked,
              onChanged: (value) => checkboxModel.updateIsChecked(),
              // onChanged: onChanged,
            ),
          ),
          Text(
            day,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
