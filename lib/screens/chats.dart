import 'package:firexcode/firexcode.dart';
import 'package:whatsapp/components/card.dart';
import 'package:whatsapp/models/chatmodel.dart';
import 'package:whatsapp/screens/allcontact.dart';

class ChatsPage extends StatefulWidget {
  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  // ignore: non_constant_identifier_names
  List<ChatModel> Chats = [
    ChatModel(
        name: "Rashid",
        isGroup: false,
        currentMessage: " Hi",
        time: "5:14",
        icon: "person.svg"),
    ChatModel(
        name: "Suhail",
        isGroup: false,
        currentMessage: " Hello",
        time: "2:14",
        icon: "person.svg"),
    ChatModel(
        name: "College",
        isGroup: true,
        currentMessage: " hello ... ",
        time: "8:34",
        icon: "groups.svg"),
    ChatModel(
        name: "Shuaib",
        isGroup: false,
        currentMessage: " Hello...",
        time: "9:17",
        icon: "person.svg"),
    ChatModel(
        name: "NSIT",
        isGroup: true,
        currentMessage: " Hi Nsit",
        time: "3:14",
        icon: "groups.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => AllContact()));
        },
        child: Icons.chat.xIcon(color: Colors.white, size: 20),
      ),
      body: ListView.builder(
        itemCount: Chats.length,
        itemBuilder: (contex, index) => CustomCard(
          chatModel: Chats[index],
        ),
      ),
    );
  }
}
