import 'package:firexcode/firexcode.dart';

class ButtonCard extends StatelessWidget {
  final String name;
  final IconData icon;

  const ButtonCard({Key key, this.name, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xFF128C7E),
          radius: 23,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: name.xText(fontWeight: FontWeight.bold, fontsize: 15),
      ),
    );
  }
}
