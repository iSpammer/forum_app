import 'topic.dart';

class Forum {
  final String title;
  final String imagePath;
  final String rank;
  final List<Topic> topics;
  final String threads;
  final String subs;

  Forum(
      {this.title,
      this.imagePath,
      this.rank,
      this.threads,
      this.subs,
      this.topics});
}

final sportForum = Forum(
  title: "Sports",
  imagePath: "images/sport.jpg",
  rank: "31",
  threads: "88",
  subs: "500+",
  topics: sportTopics,
);

final gamesForum = Forum(
  title: "Games",
  imagePath: "images/games.jpg",
  rank: "25",
  threads: "120",
  subs: "1000+",
  topics: gameTopics,
);

final forums = [sportForum, gamesForum];
