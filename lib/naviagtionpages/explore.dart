import 'package:flutter/material.dart';
import 'package:youtube/models/youtube_model.dart';
import 'package:youtube/video_list.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 350,
          child: GridView.count(
            primary: false,
            shrinkWrap: false,
            childAspectRatio: 2.3,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 3,
                  child: const Text("Trending"),
                  color: Colors.red[600],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 3,
                  padding: const EdgeInsets.all(8),
                  child: const Text('Music'),
                  color: Colors.teal[200],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 3,
                  padding: const EdgeInsets.all(8),
                  child: const Text('Gaming'),
                  color: Colors.red[100],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 3,
                  padding: const EdgeInsets.all(8),
                  child: const Text('News'),
                  color: Colors.blue[800],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 3,
                  padding: const EdgeInsets.all(8),
                  child: const Text('Movies'),
                  color: Colors.yellow,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 3,
                  padding: const EdgeInsets.all(8),
                  child: const Text('Fashion & Beauty'),
                  color: Colors.teal[600],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 3,
                  padding: const EdgeInsets.all(8),
                  child: const Text('Learning'),
                  color: Colors.green[400],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 3,
                  padding: const EdgeInsets.all(8),
                  child: const Text('Live'),
                  color: Colors.teal[400],
                ),
              ),
            ],
          ),
        ),
        VideoList(
          listData: youtubeData,
        )
      ],
    );
  }
}
