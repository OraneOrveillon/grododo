import 'package:flutter/material.dart';
import 'package:grododo/model/alarm_provider.dart';
import 'package:provider/provider.dart';

import '../../model/alarm.dart';

class AlarmsPage extends StatelessWidget {
  const AlarmsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> alarms = _generateAlarmsExample();
    return ListView.builder(
      itemCount: alarms.length,
      itemBuilder: (context, index) => alarms[index],
    );
  }

  List<Widget> _generateAlarmsExample() {
    List<Alarm> alarms = Alarm.generateRandomAlarms();
    return alarms
        .map((alarm) => Card(
              color: Colors.white.withOpacity(0.2),
              shadowColor: Colors.transparent,
              elevation: 0,
              semanticContainer: true,
              borderOnForeground: true,
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(alarm.hour),
                      subtitle: Text(alarm.repetition.join(', ')),
                    ),
                  ),
                  ChangeNotifierProvider(
                    create: (_) => AlarmProvider(alarm: alarm),
                    child: Consumer<AlarmProvider>(
                      builder: (context, alarmProvider, child) => Switch(
                          value: alarmProvider.alarm.activated,
                          onChanged: (value) {
                            alarmProvider.updateActivated(value);
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
                          }),
                    ),
                  )
                ],
              ),
            ))
        .toList();
  }
}
