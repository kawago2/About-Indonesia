import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../utils/constant.dart';
import '../utils/propotionate.dart';

class MarkCard extends StatelessWidget {
  const MarkCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          LineIcons.github,
          color: kPColor,
          size: MyUtility(context).height * 0.1,
        ),
        Text('Made by kawago2'),
        SizedBox(height: 15),
      ],
    );
  }
}
