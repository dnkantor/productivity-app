import 'package:be_productive/models/global.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkGreyColor,
      child: ListView(
        padding: EdgeInsets.only(top: 250),
        children: getList(),
      ),
    );
  }

  List<Widget> getList() {
    List<Container> list = [];
    for (int i = 0; i < 10; i++) {
      list.add(
        Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)
            ),
            color: redColor,
          ),
        )
      );
      list.add(
        Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)
            ),
            color: Colors.green,
          ),
        ),
      );
    }

    
    return list;
  }
}