import 'package:flutter/material.dart';
import 'package:toktik_app/domain/entities/video_post.dart';
import 'package:toktik_app/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik_app/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost video = videos[index];

        return Stack(
          children: [
            SizedBox.expand(
                child: FullScreenPlayer(
              caption: video.caption,
              videoUrl: video.videoUrl,
            )),
            Positioned(bottom: 20, right: 20, child: VideoButtons(video: video))
          ],
        );
      },
    );
  }
}
