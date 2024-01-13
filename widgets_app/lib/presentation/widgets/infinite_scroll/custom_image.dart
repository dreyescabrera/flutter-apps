import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;
  final int imageId;

  const CustomImage({super.key, required this.imageUrl, required this.imageId});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      FadeInImage(
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
          imageErrorBuilder: (context, error, stackTrace) {
            return const Text('wtf johnny esta vaina esta muy rara');
          },
          placeholder: const AssetImage('assets/images/jar-loading.gif'),
          image: NetworkImage(imageUrl)),
      Positioned(
          right: 0,
          bottom: 0,
          child: Container(
              padding: const EdgeInsetsDirectional.all(10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5))),
              child: Text(
                imageId.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ))),
    ]);
  }
}
