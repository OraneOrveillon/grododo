import 'package:flutter/material.dart';

import '../size_config.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({Key? key, required this.titleText, required this.subtitleText})
      : super(key: key);

  final String titleText;
  final String? subtitleText;

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);
    return ListTile(
      title: Text(
        titleText,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: sizeConfig.blockSizeVertical * 2.5,
              fontWeight: FontWeight.bold,
            ),
      ),
      subtitle: subtitleText != null
          ? Text(
              subtitleText!,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: sizeConfig.blockSizeVertical * 2,
                  ),
            )
          : null,
    );
  }
}
