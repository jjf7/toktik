import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost videoPost;
  const VideoButtons({super.key, required this.videoPost});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomButton(
          icon: Icons.favorite,
          value: videoPost.likes,
          color: Colors.red,
        ),
        const SizedBox(
          height: 20,
        ),
        _CustomButton(
          icon: Icons.remove_red_eye_sharp,
          value: videoPost.views,
        ),
        const SizedBox(
          height: 20,
        ),
        Spin(
            infinite: true,
            duration: const Duration(seconds: 5),
            child: const _CustomButton(
              icon: Icons.play_arrow_sharp,
              value: 0,
            )),
      ],
    );
  }
}

class _CustomButton extends StatelessWidget {
  final int value;
  final IconData icon;
  final Color color;

  const _CustomButton({
    required this.value,
    required this.icon,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon, color: color),
        ),
        if (value > 0) Text(HumanFormats.humanReadbleNumber(value.toDouble())),
      ],
    );
  }
}
