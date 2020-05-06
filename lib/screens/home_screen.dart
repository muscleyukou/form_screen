import 'package:flutter/material.dart';

enum Muscle { like, dislike }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedItem = '男';
  List _item = ['男', '女'];

  final _controller = TextEditingController();

  var _character = Muscle.like;
  void _onChanged(Muscle value) {
    setState(() {
      _character = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '筋肉アプリ',
          style: TextStyle(fontSize: 25.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _nameInput(),
            _genderInput(),
            _questionMuscle(),
          ],
        ),
      ),
    );
  }

  _genderInput() {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            '名前',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          DropdownButton(
            items: _item.map((value) {
              return DropdownMenuItem(
                child: Text(value),
                value: value,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedItem = value;
              });
            },
            value: _selectedItem,
          )
        ],
      ),
    );
  }

  _nameInput() {
    return Column(
      children: <Widget>[
        Text(
          '名前',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
        ),
        TextField(
          textAlign: TextAlign.center,
          maxLines: 1,
          maxLength: 10,
          controller: _controller,
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }

  _questionMuscle() {
  return  Column(
      children: <Widget>[
        Text('筋肉は好きですか？？'),
        RadioListTile(
          value: Muscle.like,
          groupValue: _character,
          onChanged: _onChanged,
          title: Text('好き'),
        ),
        RadioListTile(
          value: Muscle.dislike,
          groupValue: _character,
          onChanged: _onChanged,
          title: Text('嫌い'),
        ),
      ],
    );
  }
}
