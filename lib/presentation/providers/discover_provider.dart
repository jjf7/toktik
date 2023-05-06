import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videosRepository;
  bool isLoadingVideos = true;
  final List<VideoPost> listVideo = [];

  DiscoverProvider({required this.videosRepository});

  void loadingNextPage() async {
    // final List<VideoPost> videos = videoPosts
    //     .map((video) => LocalVideoPost.fromJson(video).toVideoPostEntity())
    //     .toList();

    List<VideoPost> videos = await videosRepository.getTrendingVideosByPage(1);

    listVideo.addAll(videos);
    isLoadingVideos = false;
    notifyListeners();
  }
}
