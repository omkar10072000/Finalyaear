import 'package:flutter/material.dart';

class MyTextField2 extends StatelessWidget {
  final String label;
  final int? maxLines;
  final int? minLines;
  //final Icon icon;
  MyTextField2({this.label = "", this.maxLines, this.minLines});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.black87),
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
          //  suffixIcon: icon == null ? null: icon,
          labelText: label,
          labelStyle: TextStyle(color: Colors.black45),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
    );
  }
}
