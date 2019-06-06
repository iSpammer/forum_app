import 'package:flutter/material.dart';
import '../style/text_style.dart';

class TabText extends StatelessWidget {
  TabText({@required this.text, this.selected = false, this.onTap});
  final bool selected;
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -1.58,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: AnimatedDefaultTextStyle(
          style: selected ? kSelectedTabStyle : kDefaultTabStyle,
          duration: Duration(milliseconds: 400),
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
