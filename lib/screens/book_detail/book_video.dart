import 'dart:async';
import 'dart:math';

import 'package:ar_book/styles/images/images.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayder extends StatefulWidget {
  final String urlVideo;
  const CustomVideoPlayder({Key? key, required this.urlVideo})
      : super(key: key);

  @override
  _CustomVideoPlayderState createState() => _CustomVideoPlayderState();
}

class _CustomVideoPlayderState extends State<CustomVideoPlayder> {
  
  TargetPlatform? _platform;
  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController!.dispose();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.network(widget.urlVideo);

    await _videoPlayerController1.initialize();
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController1,
        autoPlay: true,
        looping: true,
        allowFullScreen: true,
        aspectRatio: 16 / 9,
        deviceOrientationsAfterFullScreen: [
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
        subtitleBuilder: (context, dynamic subtitle) => Container(
              padding: const EdgeInsets.all(20.0),
              child: subtitle is InlineSpan
                  ? RichText(
                      text: subtitle,
                    )
                  : Text(
                      subtitle.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
            ));
    _chewieController!.addListener(() {
      if (_chewieController!.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      } else if (_chewieController!.isPlaying) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: _chewieController != null &&
                      _chewieController!
                          .videoPlayerController.value.isInitialized
                  ? Chewie(
                      controller: _chewieController!,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Text('Loading'),
                      ],
                    ),
            ),
            Positioned(
              top: 30,
              left: 10,
              child: IconButton(
                color: Colors.white,
                icon: Images.imageAssets(
                  Images.ic_back,
                  fit: BoxFit.scaleDown,
                  height: 20,
                  width: 20,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
