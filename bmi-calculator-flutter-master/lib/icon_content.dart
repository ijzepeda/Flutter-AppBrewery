import 'package:flutter/material.dart';

import 'constants.dart';

class GenderContent extends StatelessWidget {
  GenderContent({@required this.genderIcon, this.genderText});
  final IconData genderIcon;
  final String genderText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: kIconSize,
        ),
        SizedBox(
          height: KSizedBox,
        ),
        Text(
          genderText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
