import 'package:flutter/material.dart';
import '../style/colors.dart';
import '../style/text_style.dart';

class AppBackground extends StatelessWidget {
  final Color firstCircColor, secondCircColor, thirdCircColor;

  AppBackground(
      {this.firstCircColor, this.secondCircColor, this.thirdCircColor});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        final height = constraint.maxHeight;
        final width = constraint.maxWidth;
        print(height);
        print(width);
        return Stack(
          children: <Widget>[
            Container(
              color: kBackgroundColor,
            ),
            Positioned(
              left: -(height / 2 - width / 2),
              bottom: height / 100 - width / 2,
              child: Container(
                height: height * 2,
                width: width * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: firstCircColor,
                ),
              ),
            ),
            Positioned(
              left: width * 0.15,
              top: -width * 0.5,
              child: Container(
                height: width * 1.6,
                width: width * 1.6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: secondCircColor,
                ),
              ),
            ),
            Positioned(
              right: -width * 0.2,
              top: -width * 0.1,
              child: Container(
                height: width * 0.6,
                width: width * 0.6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: thirdCircColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
