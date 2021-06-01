import 'package:firexcode/firexcode.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp/models/chatmodel.dart';
import 'package:whatsapp/screens/individualchat.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key key, this.chatModel}) : super(key: key);
  final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndividualChat(
                      chatModel: chatModel,
                    )));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(
                chatModel.isGroup ? "assets/groups.svg" : "assets/person.svg",
                color: Colors.white,
                height: 37,
                width: 37,
              ),
              backgroundColor: Colors.blueGrey,
            ),
            title:
                chatModel.name.xText(fontsize: 16, fontWeight: FontWeight.bold),
            subtitle: Row(
              children: [
                Icons.done_all.xIcon(),
                SizedBox(width: 5),
                chatModel.currentMessage.xText(fontsize: 13)
              ],
            ),
            trailing: chatModel.time.xText(),
          ),
          Divider(
            thickness: 1,
          ).xlrp(l: 80, r: 20),
        ],
      ),
    );
  }
}
