import 'package:flutter/material.dart';

import '../size_config.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    required this.sizeConfig,
    required this.titleText,
    required this.content,
    required this.onPressedOK,
  }) : super(key: key);

  final SizeConfig sizeConfig;
  final String titleText;
  final Widget content;
  final Function() onPressedOK;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        titleText,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontSize: sizeConfig.blockSizeVertical * 3),
      ),
      content: content,
      actions: [
        TextButton(
          child: const Text('CANCEL'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            onPressedOK.call();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
