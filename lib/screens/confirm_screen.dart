import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterapp/parts/button_text.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class ConfirmScreen extends StatefulWidget {
  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
  final userName;
  final mail;
  final gender;
  final questionFirst;
  final questionSecond;

  ConfirmScreen(
      {@required this.userName,
      this.mail,
      this.gender,
      this.questionFirst,
      this.questionSecond});
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  String formResponse='';

  Future send() async {
    final Email email = Email(
      body: _resultQuestion().toString(),
      recipients: ['yukou29good0910@gmail.com'],
      cc: ['yukoufitness.0910@gmail.com'],
      isHTML: false,
    );
    try {
      await FlutterEmailSender.send(email);
      formResponse = 'success';
    } catch (e) {
      formResponse = e.toString();
    }
  }

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 80.0,
                ),
                Container(
                  color: Colors.cyanAccent,
                  height: 400.0,
                  width: 350.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'こちらの内容でよろしいでしょうか？',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text('Name：${widget.userName.toString()}'),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text('Mail：${widget.mail.toString()}'),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text('Gender：${widget.gender}'),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text('質問の回答内容'),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text('質問１：筋トレは好きですか？？'),
                      Text('回答１：${widget.questionFirst}'),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text('質問2：筋トレはどのくらいの頻度で\n行なっていますか？？'),
                      Text('回答2：${widget.questionSecond}'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text('宜ければ送信ボタンを押してください'),
                SizedBox(
                  height: 8.0,
                ),
                ButtonInText(
                    function: send,
                    color: Colors.black,
                    backgroundColor: Colors.white,
                    text: '送信する'),
                Text("送信結果:${formResponse}"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _resultQuestion() {
    return '${widget.userName.toString()}'
        '\n${widget.mail.toString()}'
        '\n${widget.gender.toString()}'
        '\n回答１：${widget.questionFirst}'
        '\n回答2：${widget.questionSecond}';
  }
}
