import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik_app/config/helpers/human_formatter.dart';
import 'package:toktik_app/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          icon: Icons.favorite,
          value: video.likes,
          color: Colors.red,
        ),
        const SizedBox(
          height: 10,
        ),
        _CustomIconButton(
          icon: Icons.remove_red_eye_outlined,
          value: video.views,
        ),
        const SizedBox(
          height: 10,
        ),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 6),
          child: const _CustomIconButton(
            icon: Icons.play_circle_outlined,
            value: 0,
          ),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData icon;
  final Color color;

  const _CustomIconButton({required this.value, required this.icon, color})
      : color = color ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: color,
            )),
        if (value > 0) Text(HumanFormatter.toReadableNumber(value.toDouble()))
      ],
    );
  }
}
