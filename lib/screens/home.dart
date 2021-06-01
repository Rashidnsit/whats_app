import 'package:firexcode/firexcode.dart';
import 'package:whatsapp/screens/calls.dart';
import 'package:whatsapp/screens/camera.dart';
import 'package:whatsapp/screens/chats.dart';

import 'package:whatsapp/screens/status.dart';

class HomePgae extends StatefulWidget {
  @override
  _HomePgaeState createState() => _HomePgaeState();
}

class _HomePgaeState extends State<HomePgae> {
  @override
  Widget build(BuildContext context) {
    return xTabBarView
        .list([
          CameraScreen(),
          ChatsPage(),
          Status(),
          Calls(),
        ])
        .xScaffold(
            appBar: "WhatsApp".xTextColorWhite().xAppBar(
                actions: [
              Icons.search.xIcons().xIconButton(onPressed: () {}),
              PopupMenuButton<String>(onSelected: (value) {
                print(value);
              }, itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(child: "New Gruop".xText(), value: "New Gruop"),
                  PopupMenuItem(
                      child: "New Broadcast".xText(), value: "New Broadcast"),
                  PopupMenuItem(
                      child: "Whatsapp web".xText(), value: "Whatsapp web"),
                  PopupMenuItem(
                      child: "Starred message".xText(),
                      value: "Starred message"),
                  PopupMenuItem(child: "Settings".xText(), value: "Settings"),
                ];
              }),
            ],
                bottom: XTabBar(indicatorColor: Colors.white).list([
                  Icons.camera_alt
                      .xIcon(
                        activeColor: Colors.white,
                        size: 20,
                      )
                      .xIconButton(onPressed: () {}),
                  "CHATS".xTabText(),
                  "STATUS".xTabText(),
                  "CALL".xTabText(),
                ])))
        .xDTController(length: 4);
  }
}
