import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/alarm.dart';
import '../../model/alarm_model.dart';
import '../components/list_tile.dart';
import 'alarm_settings_page.dart';

class AlarmsPage extends StatelessWidget {
  const AlarmsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> alarms = _generateAlarmsExample(context);
    return ListView.builder(
      itemCount: alarms.length,
      itemBuilder: (context, index) => alarms[index],
    );
  }

  List<Widget> _generateAlarmsExample(BuildContext context) {
    List<Alarm> alarms = Alarm.generateRandomAlarms();
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
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          /// To pass a model through a different route
                          builder: (context) => ChangeNotifierProvider<AlarmModel>.value(
                            value: alarmModel,
                            child: const AlarmSettingsPage(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
        .toList();
  }
}
