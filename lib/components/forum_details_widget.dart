import 'package:flutter/material.dart';
import 'package:forum_app/style/text_style.dart';
import 'package:forum_app/style/colors.dart';
import 'package:forum_app/model/forum.dart';
import 'label_value_widget.dart';

class ForumDetailsWidget extends StatelessWidget {
  final Forum forum;
  ForumDetailsWidget({this.forum});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClipperr(),
      child: Container(
        height: 180.0,
        padding: EdgeInsets.only(left: 20, right: 16, top: 24, bottom: 12),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.4), width: 2.0),
                    ),
                    height: 40,
                    width: 40,
                    child: Center(
                      child: Text(
                        forum.rank,
                        style: kRankStyle,
                      ),
                    ),
                  ),
                  Text(
                    "new",
                    style: kLabelTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LabelValueWidget(
                  value: forum.topics.length.toString(),
                  label: "Topics",
                  labelStyle: kLabelTextStyle,
                  valueStyle: kValueTextStyle,
                ),
                LabelValueWidget(
                  value: forum.threads,
                  label: "Threads",
                  labelStyle: kLabelTextStyle,
                  valueStyle: kValueTextStyle,
                ),
                LabelValueWidget(
                  value: forum.subs,
                  label: "Subs",
                  labelStyle: kLabelTextStyle,
                  valueStyle: kValueTextStyle,
                ),
              ],
            ),
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}

class CustomClipperr extends CustomClipper<Path> {
  final double distanceFromWall = 12;
  final double controlPointDistanceFromWall = 2;

  @override
  Path getClip(Size size) {
    final double height = size.height;
    final double halfHeight = size.height * 0.5;
    final double width = size.width;

    Path clippedPath = Path();
    clippedPath.moveTo(0, halfHeight);
    clippedPath.lineTo(0, height - distanceFromWall);
    clippedPath.quadraticBezierTo(0 + controlPointDistanceFromWall,
        height - controlPointDistanceFromWall, 0 + distanceFromWall, height);
    clippedPath.lineTo(width, height);
    clippedPath.lineTo(width, 0 + 30.0);
    clippedPath.quadraticBezierTo(width - 5, 0 + 5.0, width - 35, 0 + 15.0);
    clippedPath.close();
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
