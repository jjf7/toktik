import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DiscoverProvider discoverProvider = context.watch<DiscoverProvider>();
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: discoverProvider.listVideo.length,
        itemBuilder: (context, index) {
          final videoPost = discoverProvider.listVideo[index];

          return Stack(
            children: [
              // Video
              FullScreenPlayer(
                  caption: videoPost.caption, videoUrl: videoPost.videoUrl),
              // Botones
              Positioned(
                  bottom: 50,
                  right: 20,
                  child: VideoButtons(videoPost: videoPost))
            ],
          );
        },
      ),
    );
  }
}
