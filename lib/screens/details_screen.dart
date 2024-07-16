import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../models/music_video.dart';

class DetailScreen extends StatefulWidget {
  final MusicVideo musicVideo;

  DetailScreen({required this.musicVideo});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.musicVideo.previewUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.musicVideo.trackName),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.musicVideo.artistName, style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
