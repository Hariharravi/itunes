

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/music_video.dart';
import 'package:my_app/screens/details_screen.dart';

class MusicVideoItem extends StatelessWidget {
  final MusicVideo musicVideo;

  MusicVideoItem({required this.musicVideo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(musicVideo: musicVideo),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Image.network(musicVideo.artworkUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                musicVideo.trackName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                musicVideo.artistName,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
