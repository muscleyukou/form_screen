import 'package:flutter/material.dart';

class ButtonInText extends StatelessWidget {
  final VoidCallback function;
  final String  text;
  final double fontSize;
  final Color color;
  final Color backgroundColor;

  ButtonInText({@required this.function,this.text,this.fontSize,this.color,this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: backgroundColor,
        onPressed: function,
        child: Text(text,style: TextStyle(fontSize: fontSize,color:color),),
    );
  }
}
