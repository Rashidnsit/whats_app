import 'package:camera/camera.dart';
import 'package:firexcode/firexcode.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/screens/camerapage.dart';
import 'package:whatsapp/screens/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePgae().xMaterialApp(
        theme: ThemeData(
            primaryColor: Color(0xFF075E54),
            accentColor: Color(0xFF128C7E),
            fontFamily: "OpenSans",
            appBarTheme: AppBarTheme(
              backgroundColor: Color(0xFF075E54),
              elevation: 0,
            )));
  }
}
