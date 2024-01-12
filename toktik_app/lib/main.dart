import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik_app/config/theme/app_theme.dart';
import 'package:toktik_app/infrastructure/datasources/local_video_datasource.dart';
import 'package:toktik_app/infrastructure/repositories/video_posts_repository.dart';
import 'package:toktik_app/presentation/providers/discover_provider.dart';
import 'package:toktik_app/presentation/screens/discover/discover_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final videoPostRepository =
      VideoPostsRepositoryImpl(videoPostDataSource: LocalVideoDataSourceImpl());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) =>
                DiscoverProvider(videoPostRepository: videoPostRepository))
      ],
      child: MaterialApp(
          title: 'TokTik',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          home: const DiscoverScreen()),
    );
  }
}
