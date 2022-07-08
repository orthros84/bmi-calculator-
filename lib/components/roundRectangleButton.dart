import 'package:flutter/material.dart';

class RoundRectangleButton extends StatelessWidget {
  RoundRectangleButton({@required this.onPressed, @required this.text});
  final Function onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Text(
        text,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      fillColor: Color(0xFFDE1555),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 250, height: 70.0),
    );
  }
}
