import 'package:flutter/material.dart';
import 'models/global.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Be Productive',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Be Productive'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        color: Colors.red,
        home: SafeArea(
            child: DefaultTabController(
            length: 3,
            child: new Scaffold(
              body: Stack(
                  children: <Widget> [
                    TabBarView(
                    children: [
                      new Container(
                        color: darkGreyColor,
                      ),
                      new Container(color: Colors.black,),
                      new Container(
                        color: Colors.lightGreen,
                      ),
                    ],
                  ),
                  Container( 
                    padding: EdgeInsets.only(left: 50),
                    height: 165,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)
                      ),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        Text("Add a task.", style: mainPageTitleStyle,),
                        Container()
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    margin: EdgeInsets.only(top: 130, left: MediaQuery.of(context).size.width * 0.5 - 35),
                    child: FloatingActionButton(
                      child: Icon(Icons.add, size: 50,),
                      backgroundColor: redColor,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              appBar: AppBar(
                    elevation: 0,
                    title: new TabBar(
                    tabs: [
                      Tab(
                        icon: new Icon(Icons.home),
                      ),
                      Tab(
                        icon: new Icon(Icons.rss_feed),
                      ),
                      Tab(
                        icon: new Icon(Icons.perm_identity),
                      ),
                    ],
                    labelColor: darkGreyColor,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.all(5.0),
                    indicatorColor: Colors.transparent,
                ),
                backgroundColor: Colors.white,
              ),
              backgroundColor: Colors.white,
              
            ),
          ),
        ),
      );
  }
}
