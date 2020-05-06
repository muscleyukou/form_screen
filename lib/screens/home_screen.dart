import 'package:flutter/material.dart';
import 'package:flutterapp/parts/button_text.dart';
import 'package:flutterapp/screens/confirm_screen.dart';

enum Muscle { like, dislike }
enum Training { one, two, three }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedItem = '男';
  List _item = ['男', '女'];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  String _name = '';
  String _mail = '';
  List<String> _txtList = ['1-3日', '2-5日', '6-7日'];
  List<String> _txtListLike=['好き','嫌い'];

  //筋トレ好きか
  var _character = Muscle.like;



  void _onChanged(Muscle value) {
    setState(() {
      _character = value;
    });
  }

  //筋トレ頻度
  var _frequency = Training.one;

  void _onTouched(Training value) {
    setState(() {
      _frequency = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Question Trainng',
            style: TextStyle(fontSize: 25.0),
          ),
          centerTitle: true,
          backgroundColor: Colors.cyanAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0,),
              _nameInput(),
              SizedBox(height: 10.0,),
              _mailAdress(),
              SizedBox(height: 10.0,),
              _genderInput(),
              SizedBox(height: 25.0,),
              _questionMuscle(),
              SizedBox(height: 10.0,),
              _questionMuscleFrequency(),
              SizedBox(height: 30.0,),
              ButtonInText(
                text: '確認画面へ進む',
                color: Colors.white,
                backgroundColor: Colors.greenAccent,
                function: _nextPageFunction(),
              ),
            ],
          ),
        ),
      ),
    );
  }


//名前入力蘭
  _nameInput() {
    return Column(
      children: <Widget>[
        Text(
          '名前',
          style: TextStyle(fontSize: 20.0),
        ),
        TextFormField(
          textAlign: TextAlign.center,
          maxLines: 1,
          maxLength: 10,
          controller: _nameController,
          keyboardType: TextInputType.text,
          onSaved: (String value) {
            _name = value;
          },
        ),
      ],
    );
  }

//メールフォーム
  _mailAdress() {
    return Column(
      children: <Widget>[
        Text(
          'メールアドレス',
          style: TextStyle(fontSize: 20.0),
        ),
        TextFormField(
          textAlign: TextAlign.center,
          maxLines: 1,
          controller: _mailController,
          keyboardType: TextInputType.text,
          onSaved: (String value) {
            _mail = value;
          },
        ),
      ],
    );
  }

  //性別
  _genderInput() {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            '性別',
            style: TextStyle(fontSize: 20.0,),
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

  //筋トレ好きか
  _questionMuscle() {
    return Column(
      children: <Widget>[
        Text('筋トレは好きですか？？', textAlign: TextAlign.left,),
        RadioListTile(
          value: Muscle.like,
          groupValue: _character,
          onChanged: _onChanged,
          title: Text(_txtListLike[0]),
        ),
        RadioListTile(
          value: Muscle.dislike,
          groupValue: _character,
          onChanged: _onChanged,
          title: Text(_txtListLike[1]),
        ),
      ],
    );
  }

  //筋トレ頻度
  _questionMuscleFrequency() {
    return Column(
      children: <Widget>[
        Text('筋トレはどのくらいの頻度で行なっていますか？？', textAlign: TextAlign.left),
        RadioListTile(
          value: Training.one,
          groupValue: _frequency,
          onChanged: _onTouched,
          title: Text(_txtList[0]),
        ),
        RadioListTile(
          value: Training.two,
          groupValue: _frequency,
          onChanged: _onTouched,
          title: Text(_txtList[1]),
        ),
        RadioListTile(
          value: Training.three,
          groupValue: _frequency,
          onChanged: _onTouched,
          title: Text(_txtList[2]),
        ),
      ],
    );
  }

  _nextPageFunction() {
    return () =>
        Navigator.push(context, MaterialPageRoute(builder:
            (context) =>
            ConfirmScreen(
              userName: _nameController.text,
              mail: _mailController.text,
              gender: _selectedItem,
             questionFirst:_trainingText() ,
              questionSecond: _frequencyText(),
            )));
  }
  _trainingText() {
    switch (_character) {
      case Muscle.like:
        return _txtListLike[0];
        break;
      case Muscle.dislike:
        return _txtListLike[1];
        break;
    }
  }
  _frequencyText() {
    switch (_frequency) {
      case Training.one:
        return _txtList[0];
        break;
      case Training.two:
        return _txtList[1];
        break;
      case Training.three:
        return _txtList[2];
        break;
    }
  }


}
