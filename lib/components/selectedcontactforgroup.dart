import 'package:firexcode/firexcode.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp/models/chatmodel.dart';

class SelectContactGroup extends StatelessWidget {
  final ChatModel contact;

  const SelectContactGroup({Key key, this.contact}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return xColumnCE
        .list([
          Stack(
            children: [
              CircleAvatar(
                radius: 23,
                child: SvgPicture.asset(
                  "assets/person.svg",
                  color: Colors.white,
                  height: 30,
                  width: 30,
                ),
                backgroundColor: Colors.blueGrey[200],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 9,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2),
          contact.name.xText(fontsize: 12),
        ])
        .xlbtp(b: 10, t: 0, l: 5)
        .xrp(value: 5);
  }
}
