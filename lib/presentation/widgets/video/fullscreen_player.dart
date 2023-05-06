import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String caption;
  final String videoUrl;
  const FullScreenPlayer(
      {super.key, required this.caption, required this.videoUrl});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(
        "https://player.vimeo.com/video/430014215?title=0&portrait=0&byline=0&autoplay=1&muted=true")
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FutureBuilder(
        future: controller.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
                child: CircularProgressIndicator(strokeWidth: 2));
          }

          print(controller);

          return GestureDetector(
            onTap: () {
              if (controller.value.isPlaying) {
                controller.pause();
                return;
              }
              controller.play();
            },
            child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: Stack(
                  children: [
                    VideoPlayer(controller),

                    // Gradiente
                    VideoBackground(
                      stops: const [0.8, 1.0],
                    ),

                    // Texto
                    Positioned(
                      bottom: 50,
                      left: 20,
                      child: _VideoCaption(caption: widget.caption),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.7,
      child: Text(caption, maxLines: 2, style: titleStyle),
    );
  }
}
