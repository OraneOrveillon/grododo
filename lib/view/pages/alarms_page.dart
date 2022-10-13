import 'package:flutter/material.dart';
import 'package:grododo/view/size_config.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../model/alarm.dart';
import '../../viewmodel/alarm_hive.dart';
import '../../viewmodel/alarm_model.dart';
import '../components/list_tile.dart';
import 'alarm_settings_page.dart';

class AlarmsPage extends StatelessWidget {
  const AlarmsPage({Key? key, required this.box}) : super(key: key);

  final Box<Alarm> box;

  @override
  Widget build(BuildContext context) {
    List<Widget> alarms = _generateAlarmsExample(context);
    SizeConfig sizeConfig = SizeConfig(context);
    return Stack(
      children: [
        ListView.builder(
          itemCount: alarms.length,
          itemBuilder: (context, index) => alarms[index],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: sizeConfig.blockSizeVertical * 12),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const CircleBorder()),
                minimumSize: MaterialStateProperty.all(
                  Size.square(sizeConfig.blockSizeVertical * 8),
                ),
              ),
              onPressed: () => _goToAlarmSettingsPage(
                  context, AlarmModel(alarm: Alarm.base())),
              child: const Icon(Icons.add),
            ),
          ),
        )
      ],
    );
  }

  List<Widget> _generateAlarmsExample(BuildContext context) {
    List<Alarm> alarms = Alarm.generateRandomAlarms();
    final AlarmHive alarmHive = AlarmHive(box);
    alarms = alarmHive.alarms;
    return alarms
        .map(
          (alarm) => Card(
            child: ChangeNotifierProvider(
              create: (_) => AlarmModel(alarm: alarm),
              child: Consumer<AlarmModel>(
                builder: (context, alarmModel, child) => Row(
                  children: [
                    Expanded(
                      child: CustomListTile(
                        titleText: alarmModel.alarm.time.format(context),
                        subtitleText: alarmModel.alarm.repetition.toString(),
                      ),
                    ),
                    Switch(
                      value: alarmModel.alarm.activated,
                      onChanged: (value) {
                        alarmModel.updateActivated(value);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            margin: const EdgeInsets.fromLTRB(50, 0, 50, 10),
                            content: Text(
                              value ? 'Alarm activated' : 'Alarm deactivated',
                              textAlign: TextAlign.center,
                            ),
                            duration: const Duration(milliseconds: 700),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                      ),
                      onPressed: () =>
                          _goToAlarmSettingsPage(context, alarmModel),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                      ),
                      // todo
                      onPressed: () => {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  void _goToAlarmSettingsPage(BuildContext context, AlarmModel alarmModel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        /// To pass a model through a different route
        builder: (context) => ChangeNotifierProvider<AlarmModel>.value(
          value: alarmModel,
          child: const AlarmSettingsPage(),
        ),
      ),
    );
  }
}
