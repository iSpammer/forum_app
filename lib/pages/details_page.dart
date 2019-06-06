import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:forum_app/components/app_background.dart';
import 'package:forum_app/components/label_value_widget.dart';
import 'package:forum_app/style/text_style.dart';
import 'package:forum_app/style/colors.dart';
import 'package:forum_app/model/forum.dart';
import 'package:forum_app/model/topic.dart';

class DetailsPage extends StatefulWidget {
  final Forum forum;

  DetailsPage({this.forum});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _fadeAnimation;
  Animation<double> _scaleAnimation;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _offsetAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
        .animate(_controller);
  }

  _playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(
            firstCircColor: kFirstCircleDetColor,
            secondCircColor: kSecondCircleDetColor,
            thirdCircColor: kThirdCircleDetColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 60.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              FutureBuilder(
                future: _playAnimation(),
                builder: (context, snapshot) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 100.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          LabelValueWidget(
                            value: widget.forum.topics.length.toString(),
                            label: "topics",
                            labelStyle: kWhiteLabelTextStyle,
                            valueStyle: kWhiteValueTextStyle,
                          ),
                          LabelValueWidget(
                            value: widget.forum.threads,
                            label: "threads",
                            labelStyle: kWhiteLabelTextStyle,
                            valueStyle: kWhiteValueTextStyle,
                          ),
                          LabelValueWidget(
                            value: widget.forum.subs,
                            label: "subs",
                            labelStyle: kWhiteLabelTextStyle,
                            valueStyle: kWhiteValueTextStyle,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              Hero(
                tag: widget.forum.title,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(60.0)),
                  child: Image.asset(widget.forum.imagePath),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0)),
              child: Container(
                height: 300.0,
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Topics",
                        style: kSubHeadingStyle.copyWith(fontSize: 26),
                      ),
                      Expanded(
                        child: SlideTransition(
                          position: _offsetAnimation,
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              TopicsTile(topic: widget.forum.topics[0]),
                              TopicsTile(topic: widget.forum.topics[1])
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 260,
            right: 20,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Material(
                elevation: 10.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    widget.forum.rank,
                    style: kRankBigStyle,
                  ),
                ),
                color: Colors.white,
                shape: CircleBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopicsTile extends StatelessWidget {
  final Topic topic;

  TopicsTile({this.topic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                topic.question,
                style: kTopicQuesTextStyle,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: kPrimaryColor,
                ),
                child: Text(
                  topic.answerCount,
                  style: kTopicAnswTextStyle,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Text(
              topic.recentAnsw,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: kTopicAnswTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
