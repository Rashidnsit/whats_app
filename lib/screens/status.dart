import 'package:firexcode/firexcode.dart';

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return xListView.list([]).xScaffold();
  }
}
