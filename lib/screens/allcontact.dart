import 'package:firexcode/firexcode.dart';
import 'package:whatsapp/components/allcontactcard.dart';
import 'package:whatsapp/components/buttoncard.dart';
import 'package:whatsapp/models/chatmodel.dart';
import 'package:whatsapp/screens/creategroup.dart';

class AllContact extends StatefulWidget {
  @override
  _AllContactState createState() => _AllContactState();
}

class _AllContactState extends State<AllContact> {
  List<ChatModel> contacts = [
    ChatModel(name: "Rashid", status: "hi"),
    ChatModel(name: "Shuaib", status: "Hello"),
    ChatModel(name: "Subhan", status: "Hi"),
    ChatModel(name: "Rohit", status: "Hello"),
    ChatModel(name: "Rashid", status: "hi"),
    ChatModel(name: "Shuaib", status: "Hello"),
    ChatModel(name: "Subhan", status: "Hi"),
    ChatModel(name: "Rohit", status: "Hello"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Select Contact".xText(
              color: Colors.white,
              fontsize: 19,
              fontWeight: FontWeight.bold,
            ),
            "120 Contacts".xText(
              color: Colors.white,
              fontsize: 13,
            ),
          ],
        ),
        actions: [
          Icons.search
              .xIcon(color: Colors.white, size: 26)
              .xIconButton(onPressed: () {}),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                  child: "Invite a friend".xText(), value: "Invite a friend"),
              PopupMenuItem(child: "Contacts".xText(), value: "Contacts"),
              PopupMenuItem(child: "Refresh".xText(), value: "Refresh"),
              PopupMenuItem(child: "Help".xText(), value: "Help"),
            ];
          }),
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => CreateGroup()));
                  },
                  child: ButtonCard(icon: Icons.group, name: "New Group"));
            } else if (index == 1) {
              return ButtonCard(
                icon: Icons.person_add,
                name: "New Contact",
              );
            }
            return ContactCard(
              contact: contacts[index - 2],
            );
          }),
    );
  }
}
