import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoPost {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoPost({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  factory LocalVideoPost.fromJson(Map<String, dynamic> json) => LocalVideoPost(
        name: json["name"] ?? "No name",
        videoUrl: json["videoUrl"],
        likes: json["likes"] ?? 0,
        views: json["views"] ?? 0,
      );

  VideoPost toVideoPostEntity() =>
      VideoPost(caption: name, videoUrl: videoUrl, likes: likes, views: views);
}
