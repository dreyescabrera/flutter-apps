import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const Slide(
      {super.key,
      required this.title,
      required this.caption,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(imageUrl),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(title, style: titleStyle),
          const SizedBox(
            height: 20,
          ),
          Text(
            caption,
            style: captionStyle,
          ),
        ],
      ),
    );
  }
}
