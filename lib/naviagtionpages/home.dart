import 'package:flutter/material.dart';
import '../models/youtube_model.dart';
import '../video_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VideoList(
      listData: youtubeData,
    );
  }
}
