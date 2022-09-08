import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../model/sleep_model.dart';
import '../size_config.dart';

class SleepPage extends StatelessWidget {
  const SleepPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);
    return ChangeNotifierProvider<SleepModel>(
      create: (_) => SleepModel(),
      child: Consumer<SleepModel>(
        builder: (context, sleepModel, child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return Text(
                    DateFormat('hh:mm a').format(DateTime.now()),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: sizeConfig.blockSizeHorizontal * 15),
                  );
                },
              ),
              Text(
                'Alarm rings in ',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: sizeConfig.blockSizeHorizontal * 5),
              ),
              ElevatedButton(
                onPressed: () => sleepModel.updateIsSleeping(),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.resolveWith((states) => Size(
                        sizeConfig.blockSizeHorizontal * 50,
                        sizeConfig.blockSizeVertical * 6,
                      )),
                ),
                child: Text(
                  sleepModel.isSleeping ? 'Awake' : 'I am going to bed',
                  style: TextStyle(fontSize: sizeConfig.blockSizeVertical * 2.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
