import 'package:be_productive/models/global.dart';
import 'package:flutter/material.dart';


class MainTodo extends StatelessWidget {
  final String keyValue;
  final String title;
  MainTodo({this.keyValue, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
          key: Key(keyValue),
          height: 100,
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.025, right: MediaQuery.of(context).size.width *0.025, top: 10, bottom: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)
            ),
            boxShadow: [
              new BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10.0,
            ),
            ],
            color: redColor,
          ),
          child: Row(
            children: <Widget> [
              Radio(

              ),
              Column(
                children: <Widget>[
                  Text(title, style: mainPageNotesStyle,),
                ],
              ),
            ],
          ),
    );
  }
}