import 'package:firexcode/firexcode.dart';
import 'package:whatsapp/components/allcontactcard.dart';
import 'package:whatsapp/components/selectedcontactforgroup.dart';
import 'package:whatsapp/models/chatmodel.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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
  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "New Group".xText(
              color: Colors.white,
              fontsize: 19,
              fontWeight: FontWeight.bold,
            ),
            "Add Participant".xText(
              color: Colors.white,
              fontsize: 13,
            ),
          ],
        ),
        actions: [
          Icons.search
              .xIcon(color: Colors.white, size: 26)
              .xIconButton(onPressed: () {}),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contacts.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: groups.length > 0 ? 90 : 10,
                  );
                }
                return InkWell(
                  onTap: () {
                    if (contacts[index - 1].select == false) {
                      setState(() {
                        contacts[index - 1].select = true;
                        groups.add(contacts[index - 1]);
                      });
                    } else {
                      setState(() {
                        contacts[index - 1].select = false;
                        groups.remove(contacts[index - 1]);
                      });
                    }
                  },
                  child: ContactCard(
                    contact: contacts[index - 1],
                  ),
                );
              }),
          groups.length > 0
              ? Container(
                  height: 85,
                  color: Colors.white,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        if (contacts[index].select == true) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                contacts[index].select = false;
                                groups.remove(contacts[index]);
                              });
                            },
                            child: SelectContactGroup(
                              contact: contacts[index],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                )
              : Container(),
        ],
      ),
    );
  }
}
