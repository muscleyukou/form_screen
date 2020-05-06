import 'package:flutter/material.dart';

class ConfirmScreen extends StatefulWidget {
  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
  final userName;
  final mail;
  final gender;
  final questionFirst;
  final  questionSecond;
  ConfirmScreen({@required this.userName,this.mail,this.gender,this.questionFirst,this.questionSecond});
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Confirm Content',
          style: TextStyle(fontSize: 25.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
   body: Text(widget.mail.toString()),

    );

  }

}
