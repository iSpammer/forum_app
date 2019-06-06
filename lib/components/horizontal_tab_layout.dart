import 'package:flutter/material.dart';
import '../style/text_style.dart';
import '../style/colors.dart';
import 'tab_text.dart';
import 'forum_card.dart';
import 'package:forum_app/model/forum.dart';

class HorizontalTabLayout extends StatefulWidget {
  @override
  _HorizontalTabLayoutState createState() => _HorizontalTabLayoutState();
}

class _HorizontalTabLayoutState extends State<HorizontalTabLayout>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _fadedanimation;
  Animation<Offset> _animation;
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _fadedanimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(-0.05, 0))
        .animate(_controller);
  }

  playAnim() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: -30,
          bottom: 0,
          top: 0,
          width: 110,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TabText(
                  text: "Media",
                  selected: _selectedTab == 0,
                  onTap: () {
                    setState(() {
                      _selectedTab = 0;
                    });
                  },
                ),
                TabText(
                  text: "Streamers",
                  selected: _selectedTab == 1,
                  onTap: () {
                    setState(() {
                      _selectedTab = 1;
                    });
                  },
                ),
                TabText(
                  text: "Forum",
                  selected: _selectedTab == 2,
                  onTap: () {
                    setState(() {
                      _selectedTab = 2;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 65.0),
          child: FutureBuilder(
            future: playAnim(),
            builder: (context, snapshot) {
              return FadeTransition(
                opacity: _fadedanimation,
                child: SlideTransition(
                  position: _animation,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: getList(_selectedTab),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  List<Widget> getList(index) {
    return [
      [
        ForumCard(
          forum: sportForum,
        ),
        ForumCard(
          forum: gamesForum,
        )
      ],
      [
        ForumCard(
          forum: gamesForum,
        ),
        ForumCard(
          forum: sportForum,
        ),
      ],
      [
        ForumCard(
          forum: sportForum,
        ),
        ForumCard(
          forum: gamesForum,
        ),
      ],
    ][index];
  }
}
