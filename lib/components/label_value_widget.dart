import 'package:flutter/material.dart';
import '../style/text_style.dart';
import '../style/colors.dart';

class LabelValueWidget extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle labelStyle;
  final TextStyle valueStyle;

  LabelValueWidget({this.label, this.value, this.labelStyle, this.valueStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          value,
          style: valueStyle,
        ),
        Text(
          label,
          style: labelStyle,
        ),
      ],
    );
  }
}
