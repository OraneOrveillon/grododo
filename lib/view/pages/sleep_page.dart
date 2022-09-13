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
          child: Stack(
            children: [
              Center(
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
                              .copyWith(fontSize: sizeConfig.blockSizeHorizontal * 17),
                        );
                      },
                    ),
                    Text(
                      'Alarm rings in ',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: sizeConfig.blockSizeHorizontal * 6),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () => sleepModel.updateIsSleeping(),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.resolveWith((states) => Size(
                              sizeConfig.blockSizeHorizontal * 60,
                              sizeConfig.blockSizeVertical * 6.5,
                            )),
                      ),
                      child: Text(
                        sleepModel.isSleeping ? 'I\'m awake' : 'I am going to bed',
                        style: TextStyle(fontSize: sizeConfig.blockSizeVertical * 3),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizeConfig.blockSizeVertical * 15,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
