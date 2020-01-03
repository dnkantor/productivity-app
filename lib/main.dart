import 'package:be_productive/UI/login/login_page.dart';
import 'package:be_productive/UI/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/global.dart';
import 'package:be_productive/models/classes/user.dart';
import 'blocs/blocs/user_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Be Productive',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
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
  SharedPreferences preferences;
  @override
  Widget build(BuildContext context) {
    //bloc.registerUser("Daniel1dadkfalR", "Daniel", "Kantor", "dnkantor@gmail.com", "password");
    return FutureBuilder(
      future: getApiKey(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        String apiKey = "";
        if (snapshot.hasData) {
          print("We're in boys.");
          print("Data " + snapshot.data);
          apiKey = snapshot.data;
        } else {
          print("Fuck boys we gotta prob'lm");
        }

        return apiKey.length > 0 ? getHomePage() : LoginPage(login: login, newUser: false);
      },
    );
  }

  void login() {
    setState(() {
      build(context);
    });
  }

  @override
  void initState() {
    super.initState();
  }


  Future getApiKey() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString("API_KEY");
  }

  logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("API_KEY", "");
    setState(() {
      build(context);
    });
  }

  Widget getHomePage() {
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
                        MainPage(),
                        new Container(color: Colors.black,),
                        new Container(
                          child: Center(
                            child: FlatButton(
                              color: redColor,
                              child: Text("Log out!"),
                              onPressed: () {
                                logout();
                              },
                            ),
                          ),
                          color: Colors.lightGreen,
                        ),
                      ],
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




