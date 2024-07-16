import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/api_service.dart';
import '../models/music_video.dart';
import '../widgets/music_video_item.dart';  // Ensure this import is added
import '../notifiers/theme_notifier.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iTunes Music Videos'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: FutureBuilder<List<MusicVideo>>(
        future: ApiService.fetchMusicVideos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          } else {
            return MusicVideoList(musicVideos: snapshot.data!);
          }
        },
      ),
    );
  }
}

class MusicVideoList extends StatefulWidget {
  final List<MusicVideo> musicVideos;
  MusicVideoList({required this.musicVideos});

  @override
  _MusicVideoListState createState() => _MusicVideoListState();
}

class _MusicVideoListState extends State<MusicVideoList> {
  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          title: Text('Toggle View'),
          value: isGrid,
          onChanged: (value) {
            setState(() {
              isGrid = value;
            });
          },
        ),
        Expanded(
          child: isGrid
              ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: widget.musicVideos.length,
            itemBuilder: (context, index) {
              return MusicVideoItem(musicVideo: widget.musicVideos[index]);
            },
          )
              : ListView.builder(
            itemCount: widget.musicVideos.length,
            itemBuilder: (context, index) {
              return MusicVideoItem(musicVideo: widget.musicVideos[index]);
            },
          ),
        ),
      ],
    );
  }
}
