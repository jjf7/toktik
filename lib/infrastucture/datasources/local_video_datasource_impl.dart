import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastucture/models/local_video_post.dart';
import 'package:toktik/shared/data.dart';

class LocalVideoDatasourceImpl implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    final List<VideoPost> videos = videoPosts
        .map((video) => LocalVideoPost.fromJson(video).toVideoPostEntity())
        .toList();

    return videos;
  }
}
