import 'dart:io';

import 'package:firexcode/firexcode.dart';

class PhotoView extends StatelessWidget {
  final String path;

  const PhotoView({Key key, this.path}) : super(key: key);
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
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
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
            ).xContainer(
                width: xwidth(context),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5))
          ],
        ),
      ),
    );
  }
}
