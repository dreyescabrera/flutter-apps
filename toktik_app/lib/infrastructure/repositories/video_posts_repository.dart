import 'package:toktik_app/domain/datasource/video_post_datasource.dart';
import 'package:toktik_app/domain/entities/video_post.dart';
import 'package:toktik_app/domain/repositories/video_post_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  final VideoPostDataSource videoPostDataSource;

  VideoPostsRepositoryImpl({required this.videoPostDataSource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoPostDataSource.getTrendingVideosByPage(page);
  }
}
