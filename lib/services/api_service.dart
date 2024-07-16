import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import '../models/music_video.dart';

class ApiService {
  static Future<List<MusicVideo>> fetchMusicVideos() async {
    final response = await http.get(Uri.parse('https://itunes.apple.com/search?term=jackjohnson&entity=musicVideo'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((json) => MusicVideo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load music videos');
    }
  }
}
