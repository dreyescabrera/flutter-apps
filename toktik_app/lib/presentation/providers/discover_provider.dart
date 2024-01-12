import 'package:flutter/material.dart';
import 'package:toktik_app/domain/entities/video_post.dart';
import 'package:toktik_app/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videoPostRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoPostRepository}) {
    loadNextPage();
  }

  Future<void> loadNextPage() async {
    final loadedVideos = await videoPostRepository.getTrendingVideosByPage(1);

    videos.addAll(loadedVideos);
    initialLoading = false;

    notifyListeners();
  }
}
