class YoutubeModel {
  final String title;
  final String description;
  final String thumbNail;
  final String publishedTime;
  final String channelTitle;
  final String channelAvatar;
  final String viewCount;
  int likeCount;
  int dislikeCount;
  final String vdoURL;
  int subsCount;

  YoutubeModel({
    this.title,
    this.description,
    this.thumbNail,
    this.publishedTime,
    this.channelTitle,
    this.channelAvatar,
    this.viewCount,
    this.likeCount,
    this.dislikeCount,
    this.vdoURL,
    this.subsCount,
  });
}

List<YoutubeModel> youtubeData = [
  YoutubeModel(
    title: "Making a beutiful UI in Android/iOS using Flutter and Dart",
    description: "This is a Youtube tutorial to make a APP in flutter and Dart",
    thumbNail:
        "https://venturebeat.com/wp-content/uploads/2018/02/google-flutter-logo.png?w=1200&strip=all",
    publishedTime: "2 days ago",
    channelTitle: "GeeksForGeeks",
    channelAvatar:
        "https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png",
    viewCount: "20k views",
    likeCount: 250,
    dislikeCount: 23,
    vdoURL:
        "https://static.videezy.com/system/resources/previews/000/004/296/original/20_20Dragon_20Coaster_20Part_204.mp4",
    subsCount: 1525,
  ),
  YoutubeModel(
    title: "Making a beutiful UI in Android/iOS using Flutter and Dart",
    description: "This is a Youtube tutorial to make a APP in flutter and Dart",
    thumbNail:
        "https://venturebeat.com/wp-content/uploads/2018/02/google-flutter-logo.png?w=1200&strip=all",
    publishedTime: "2 days ago",
    channelTitle: "GeeksForGeeks",
    channelAvatar:
        "https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png",
    viewCount: "20k views",
    likeCount: 250,
    dislikeCount: 23,
    vdoURL:
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
    subsCount: 1525,
  ),
  YoutubeModel(
    title: "Making a beutiful UI in Android/iOS using Flutter and Dart",
    description: "This is a Youtube tutorial to make a APP in flutter and Dart",
    thumbNail:
        "https://venturebeat.com/wp-content/uploads/2018/02/google-flutter-logo.png?w=1200&strip=all",
    publishedTime: "2 days ago",
    channelTitle: "GeeksForGeeks",
    channelAvatar:
        "https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png",
    viewCount: "20k views",
    likeCount: 250,
    dislikeCount: 23,
    vdoURL:
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
    subsCount: 1525,
  ),
];
