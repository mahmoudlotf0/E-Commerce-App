import 'package:flutter/material.dart';

import '../../themes/text_styles.dart';

// ignore: must_be_immutable
class DefaultTextButton extends StatelessWidget {
  Function()? onTap;
  String lable;
  DefaultTextButton({required this.lable, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        lable,
        style: kHeadLineThreeWithPrimaryColor,
      ),
      onPressed: onTap,
    );
  }
}
