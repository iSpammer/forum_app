import 'package:flutter/material.dart';
import '../components/app_background.dart';
import '../components/horizontal_tab_layout.dart';
import 'package:forum_app/style/colors.dart';
import 'package:forum_app/style/text_style.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(
            firstCircColor: kFirstCircleColor,
            secondCircColor: kSecondCircleColor,
            thirdCircColor: kThirdCircleColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Material(
                    elevation: 10.0,
                    color: Colors.white,
                    shape: CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.apps,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: HeadingSubWidget(),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 48.0, vertical: 30.0),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                    ),
                  ),
                  child: Text(
                    "New Topic",
                    style: kButtonStyle,
                  ),
                ),
              )
            ],
          ),
          Center(
            child: HorizontalTabLayout(),
          ),
        ],
      ),
    );
  }
}

class HeadingSubWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Forum",
            style: kHeadingStyleStyle,
          ),
          Text(
            ""
            "Conversation starter!",
            style: kSubHeadingStyle,
          ),
        ],
      ),
    );
  }
}
