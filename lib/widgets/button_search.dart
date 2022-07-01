import 'package:about_indonesia/utils/propotionate.dart';
import 'package:flutter/material.dart';

import '../utils/constant.dart';

class ButtonSearchBuild extends StatelessWidget {
  final GestureTapCallback onPressed;
  const ButtonSearchBuild({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.5,
      padding: EdgeInsets.all(8),
      child: MaterialButton(
        color: kTColor,
        onPressed: onPressed,
        textColor: Colors.black,
        child: Text(
          'Search',
          style: TextStyle(),
        ),
      ),
    );
  }
}
