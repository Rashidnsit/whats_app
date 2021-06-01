import 'package:emoji_picker/emoji_picker.dart';
import 'package:firexcode/firexcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp/models/chatmodel.dart';

class IndividualChat extends StatefulWidget {
  const IndividualChat({Key key, this.chatModel}) : super(key: key);
  final ChatModel chatModel;
  @override
  _IndividualChatState createState() => _IndividualChatState();
}

class _IndividualChatState extends State<IndividualChat> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    // connect();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
    // connect();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    width: xwidth(context) - 70,
                    height: 50,
                    child: Card(
                      margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        controller: _controller,
                        focusNode: focusNode,
                        keyboardType: TextInputType.multiline,
                        textAlignVertical: TextAlignVertical.center,
                        maxLines: 5,
                        minLines: 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icons.emoji_emotions
                              .xIcon(size: 25)
                              .xIconButton(onPressed: () {
                            focusNode.unfocus();
                            focusNode.canRequestFocus = false;
                            setState(() {
                              show = !show;
                            });
                          }),
                          hintText: "Type a message",
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icons.attach_file.xIcon(size: 25).xIconButton(
                                  onPressed: () {
                                showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (builder) => bottomsheet());
                              }).xrp(value: 0),
                              Icons.camera_alt
                                  .xIcon(size: 25)
                                  .xIconButton(onPressed: () {})
                                  .xlp(value: 0),
                            ],
                          ),
                          contentPadding: EdgeInsets.all(5),
                        ),
                      ),
                    ),
                  ).xrp(value: 2),
                  CircleAvatar(
                    backgroundColor: Color(0xFF128C7E),
                    radius: 22,
                    child: Icons.mic
                        .xIcon(
                          size: 25,
                          color: Colors.white,
                        )
                        .xIconButton(onPressed: () {}),
                  ).xlbp(l: 2, b: 9)
                ],
              )
                  .xlrbp(l: 10, r: 2, b: 5)
                  .xAlign(alignment: Alignment.bottomCenter),
              show ? emojiSelect() : Container(),
            ],
          )
        ],
      ).xap(value: 0).xScaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            leadingWidth: 80,
            leading: xRowCSB.list([
              Icons.arrow_back_ios
                  .xIcon(color: Colors.white, size: 22)
                  .xIconButton(onPressed: () {
                Navigator.pop(context);
              }),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(
                  widget.chatModel.isGroup
                      ? "assets/groups.svg"
                      : "assets/person.svg",
                  color: Colors.white,
                  height: 37,
                  width: 37,
                ),
              ),
            ]),
            title: xColumn.list([
              widget.chatModel.name.xText(
                color: Colors.white,
                fontsize: 18.5,
              ),
              "last Seen today at 11:32 pm"
                  .xText(color: Colors.blueGrey, fontsize: 12.2)
            ]),
            actions: [
              Icons.videocam
                  .xIcon(color: Colors.white, size: 22)
                  .xIconButton(onPressed: () {}),
              Icons.call
                  .xIcon(color: Colors.white, size: 22)
                  .xIconButton(onPressed: () {}),
              PopupMenuButton<String>(onSelected: (value) {
                print(value);
              }, itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                      child: "View Contact".xText(), value: "View Contact"),
                  PopupMenuItem(
                      child: "Media, links and docs".xText(),
                      value: "Media, links and docs"),
                  PopupMenuItem(
                      child: "Whatsapp web".xText(), value: "Whatsapp web"),
                  PopupMenuItem(child: "Search".xText(), value: "Search"),
                  PopupMenuItem(
                      child: "Mute Notification".xText(),
                      value: "Mute Notification"),
                  PopupMenuItem(child: "Wallpaper".xText(), value: "Wallpaper"),
                ];
              }),
            ],
          )),
      onWillPop: () {
        if (show) {
          setState(() {
            show = false;
          });
        } else {
          Navigator.pop(context);
        }
        return Future.value(false);
      },
    );
  }

  Widget bottomsheet() {
    return Container(
      height: 270,
      width: xwidth(context),
      child: Card(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(
                      Icons.insert_drive_file, Colors.indigo, "Documet"),
                  SizedBox(width: 40),
                  iconcreation(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(width: 40),
                  iconcreation(Icons.insert_photo, Colors.purple, "Galery"),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.headset, Colors.orange, "Audio"),
                  SizedBox(width: 40),
                  iconcreation(Icons.location_pin, Colors.teal, "Location"),
                  SizedBox(width: 40),
                  iconcreation(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconcreation(IconData icon, Color color, String text) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: color,
          child: Icon(
            icon,
            size: 24,
            color: Colors.white,
          ).xIconButton(onPressed: () {}),
        ),
        SizedBox(height: 5),
        text.xText(fontsize: 12),
      ],
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
        rows: 4,
        columns: 7,
        onEmojiSelected: (emoji, category) {
          print(emoji);
          setState(() {
            _controller.text = _controller.text + emoji.emoji;
          });
        });
  }
}
