import 'package:flutter/material.dart';
import '../model/forum.dart';
import 'forum_name_widget.dart';
import 'forum_details_widget.dart';
import 'package:flutter/cupertino.dart';
import '../pages/details_page.dart';

class ForumCard extends StatelessWidget {
  final Forum forum;

  ForumCard({this.forum});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: forum.title,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => DetailsPage(forum: forum)));
        },
        child: SizedBox(
          width: 280.0,
          child: Card(
            margin: EdgeInsets.only(top: 190, bottom: 190, left: 30, right: 30),
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    forum.imagePath,
                    fit: BoxFit.fitHeight,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: ForumDetailsWidget(forum: forum),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 80.0,
                    child: ForumNameWidget(forum: forum),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
