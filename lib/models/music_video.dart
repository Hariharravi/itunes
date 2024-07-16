class MusicVideo {
  final String trackName;
  final String artistName;
  final String artworkUrl;
  final String previewUrl;

  MusicVideo({
    required this.trackName,
    required this.artistName,
    required this.artworkUrl,
    required this.previewUrl,
  });

  factory MusicVideo.fromJson(Map<String, dynamic> json) {
    return MusicVideo(
      trackName: json['trackName'],
      artistName: json['artistName'],
      artworkUrl: json['artworkUrl100'],
      previewUrl: json['previewUrl'],
    );
  }
}
