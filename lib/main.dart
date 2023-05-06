import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/infrastucture/datasources/local_video_datasource_impl.dart';
import 'package:toktik/infrastucture/repositories/video_posts_repository_impl.dart.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostsRepositoryImpl(videosDatasource: LocalVideoDatasourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) =>
                DiscoverProvider(videosRepository: videoPostRepository)
                  ..loadingNextPage())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TokTik',
        theme: AppTheme().getTheme,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('TOkTik App'),
            centerTitle: true,
          ),
          body: const DiscoverScreen(),
        ),
      ),
    );
  }
}
