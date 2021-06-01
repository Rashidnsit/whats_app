import 'dart:ffi';
import 'dart:async';
import 'dart:math';
import 'package:camera/camera.dart';
import 'package:firexcode/firexcode.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' show join;
// import 'package:path_provider/path_provider.dart';
import 'package:whatsapp/screens/photoview.dart';
import 'package:whatsapp/screens/videoview.dart';

List<CameraDescription> cameras;

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController _cameraController;
  Future<Void> cameravalue;
  bool isRecording = false;
  bool flash = false;
  bool isCameraFront = true;
  double transform = 0;
  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameravalue = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameravalue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_cameraController).xContainer(
                      height: xheight(context), width: xwidth(context));
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Container(
            color: Colors.black,
            width: xwidth(context),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    flash
                        ? Icons.flash_on
                        : Icons.flash_off
                            .xIcon(color: Colors.white, size: 24)
                            .xIconButton(onPressed: () {
                            setState(() {
                              flash = !flash;
                            });
                            flash
                                ? _cameraController
                                    .setFlashMode(FlashMode.torch)
                                : _cameraController.setFlashMode(FlashMode.off);
                          }),
                    GestureDetector(
                      onLongPress: () async {
                        // final path = join((await getTemporaryDirectory()).path,
                        //     "${DateTime.now()}.png");
                        await _cameraController.startVideoRecording();
                        setState(() {
                          isRecording = true;
                        });
                      },
                      onLongPressUp: () async {
                        XFile videoPath =
                            await _cameraController.stopVideoRecording();
                        setState(() {
                          isRecording = false;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => VideoView(
                                      path: videoPath.path,
                                    )));
                      },
                      onTap: () {
                        if (!isRecording) takePhoto(context);
                      },
                      child: isRecording
                          ? Icons.radio_button_on
                              .xIcon(color: Colors.red, size: 70)
                          : Icons.panorama_fish_eye
                              .xIcon(color: Colors.white, size: 65),
                    ),
                    Transform.rotate(
                      angle: transform,
                      child: Icons.flip_camera_ios
                          .xIcon(color: Colors.white, size: 24)
                          .xIconButton(onPressed: () async {
                        setState(() {
                          isCameraFront = !isCameraFront;
                          transform = transform + pi;
                        });
                        int camerapos = isCameraFront ? 0 : 1;

                        _cameraController = CameraController(
                            cameras[camerapos], ResolutionPreset.high);
                        cameravalue = _cameraController.initialize();
                      }),
                    )
                  ],
                ),
                SizedBox(height: 10),
                "Holf or Video, Tap for Photo"
                    .xText(color: Colors.white)
                    .xAlign(alignment: Alignment.center)
              ],
            ),
          ).xtbp(t: 5, b: 5).xPositioned(bottom: 0),
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    // final path =
    //     join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
    XFile path = await _cameraController.takePicture();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => PhotoView(
                  path: path.path,
                )));
  }
}
