import 'package:flutter/material.dart';
import '../models/youtube_model.dart';
import '../video_list.dart';
import 'package:share/share.dart';
import 'package:video_player/video_player.dart';

class VideoDetail extends StatefulWidget {
  YoutubeModel detail;

  VideoDetail({Key key, @required this.detail}) : super(key: key);

  @override
  _VideoDetailState createState() => _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetail> {
  bool isLiked = false;
  bool isDisliked = false;
  var grey = Colors.grey[700];
  var disgrey = Colors.grey[700];
  bool isSubscribed = false;
  var subColour = Colors.red;
  var subText = "SUBSCRIBE";
  VideoPlayerController playerController;
  VoidCallback listener;

  @override
  void initState() {
    super.initState();
    listener = () {
      setState(() {});
    };
  }

  void createVideo() {
    if (playerController == null) {
      playerController = VideoPlayerController.network(widget.detail.vdoURL)
        ..addListener(listener)
        ..setVolume(1.0)
        ..initialize()
        ..play();
    } else {
      if (playerController.value.isPlaying) {
        playerController.pause();
      } else {
        playerController.initialize();
        playerController.play();
      }
    }
  }

  @override
  void deactivate() {
    playerController.setVolume(0.0);
    playerController.removeListener(listener);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _layouts = [
      _videoInfo(),
      _channelInfo(),
      _moreInfo(),
      VideoList(
        listData: youtubeData,
        isMiniList: true,
      ),
    ];

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      _layouts.clear();
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          _buildVideoPlayer(context),
          Expanded(
            child: ListView(
              children: _layouts,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createVideo();
          playerController.play();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  Widget _buildVideoPlayer(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: (playerController != null)
            ? VideoPlayer(
                playerController,
              )
            : Container(),
      ),
    );
  }

  Widget _videoInfo() {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(widget.detail.title),
          subtitle: Text(widget.detail.viewCount),
          trailing: Icon(Icons.arrow_drop_down),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(
                        Icons.thumb_up,
                        color: grey,
                      ),
                    ),
                    Text(
                      widget.detail.likeCount.toString(),
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    if (!isLiked) {
                      widget.detail.likeCount += 1;
                      isLiked = !isLiked;
                      isDisliked = false;
                      grey = Colors.blue;
                      disgrey = Colors.grey[700];
                    } else {
                      widget.detail.likeCount -= 1;
                      isLiked = !isLiked;
                      isDisliked = false;
                      grey = Colors.grey[700];
                      disgrey = Colors.grey[700];
                    }
                  });
                },
              ),
              GestureDetector(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(
                        Icons.thumb_down,
                        color: disgrey,
                      ),
                    ),
                    Text(
                      widget.detail.dislikeCount.toString(),
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    if (!isDisliked) {
                      widget.detail.dislikeCount += 1;
                      isDisliked = !isDisliked;
                      isLiked = false;
                      grey = Colors.grey[700];
                      disgrey = Colors.blue;
                    } else {
                      widget.detail.dislikeCount -= 1;
                      isDisliked = !isDisliked;
                      isLiked = false;
                      grey = Colors.grey[700];
                      disgrey = Colors.grey[700];
                    }
                  });
                },
              ),
              GestureDetector(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(
                        Icons.share,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      "Share",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
                onTap: () {
                  Share.share(widget.detail.vdoURL);
                },
              ),
              _buildButtonColumn(Icons.cloud_download, "Download"),
              _buildButtonColumn(Icons.playlist_add, "Save"),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildButtonColumn(IconData icon, String text) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Icon(
            icon,
            color: Colors.grey[700],
          ),
        ),
        Text(
          text,
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget _channelInfo() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(widget.detail.channelAvatar),
              ),
              title: Text(
                widget.detail.channelTitle,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(widget.detail.subsCount.toString()),
            ),
          ),
          FlatButton.icon(
            icon: Icon(
              Icons.play_circle_filled,
              color: subColour,
            ),
            label: Text(
              subText,
              style: TextStyle(color: subColour),
            ),
            onPressed: () {
              setState(() {
                if (!isSubscribed) {
                  subText = "SUBSCRIBED";
                  isSubscribed = !isSubscribed;
                  subColour = Colors.grey;
                  widget.detail.subsCount += 1;
                } else {
                  subText = "SUBSCRIBE";
                  isSubscribed = !isSubscribed;
                  subColour = Colors.red;
                  widget.detail.subsCount -= 1;
                }
              });
            },
          )
        ],
      ),
    );
  }

  Widget _moreInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(child: Text("Up next")),
          Text("Autoplay"),
          Switch(
            onChanged: (c) {},
            value: true,
          ),
        ],
      ),
    );
  }
}
