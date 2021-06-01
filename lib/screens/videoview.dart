import 'dart:io';

import 'package:firexcode/firexcode.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  final String path;

  const VideoView({Key key, this.path}) : super(key: key);

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Icons.crop_rotate
              .xIcon(color: Colors.white, size: 24)
              .xIconButton(onPressed: () {}),
          Icons.emoji_emotions_outlined
              .xIcon(color: Colors.white, size: 24)
              .xIconButton(onPressed: () {}),
          Icons.title
              .xIcon(color: Colors.white, size: 24)
              .xIconButton(onPressed: () {}),
          Icons.edit
              .xIcon(color: Colors.white, size: 24)
              .xIconButton(onPressed: () {}),
        ],
      ),
      body: Container(
        width: xwidth(context),
        height: xheight(context),
        child: Stack(
          children: [
            Container(
              width: xwidth(context),
              height: xheight(context) - 150,
              child: _controller.value.initialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
            TextFormField(
              maxLines: 6,
              minLines: 1,
              style: TextStyle(color: Colors.white, fontSize: 17),
              decoration: InputDecoration(
                  suffixIcon: CircleAvatar(
                    backgroundColor: Color(0xFF128C7E),
                    radius: 27,
                    child: Icons.check.xIcon(color: Colors.white, size: 25),
                  ),
                  prefixIcon: Icons.add_photo_alternate
                      .xIcon(color: Colors.white, size: 24),
                  hintText: "Add Caption.....",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white, fontSize: 17)),
            )
                .xContainer(
                    width: xwidth(context),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5))
                .xPositioned(bottom: 0),
            InkWell(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.black38,
                  radius: 40,
                  child: _controller.value.isPlaying
                      ? Icons.pause.xIcon(color: Colors.white, size: 45)
                      : Icons.play_arrow.xIcon(color: Colors.white, size: 45),
                )).xAlign(alignment: Alignment.center)
          ],
        ),
      ),
    );
  }
}
