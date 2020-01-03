import 'package:be_productive/main.dart';
import 'package:be_productive/models/global.dart';
import 'package:flutter/material.dart';
import 'package:be_productive/models/classes/user.dart';
import 'package:be_productive/blocs/blocs/user_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback login;
  final bool newUser;

  const LoginPage({Key key, this.login, this.newUser}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreyColor,
      body: Center(
        child: widget.newUser ? getSignupPage() : getSigninPage(),
      ),
    );
  }

  Widget getSigninPage() {
    TextEditingController usernameController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    return Container(
      margin: EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text("Be Productive.", style: signInTitleStyle),
          Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Theme(
                  data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                  child: TextField(
                    autofocus: false,
                    style: TextStyle(fontSize: 22.0, color: darkGreyColor),
                    decoration: InputDecoration(
                      hintText: "Username",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7)
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7)
                      )
                    ),
                    controller: usernameController,
                  ),
                ),
                Theme(
                  data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                  child: TextField(
                    autofocus: false,
                    style: TextStyle(fontSize: 22.0, color: darkGreyColor),
                    decoration: InputDecoration(
                      hintText: "Password",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7)
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7)
                      )
                    ),
                    controller: passwordController,
                  ),
                ),
                OutlineButton(
                  highlightedBorderColor: Colors.white,
                  child: Text("Sign In", style: redToDoTitleStyle),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () {

                  },
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text("Don't have an account?", style: redSubTitleStyle1),
                OutlineButton(
                  highlightedBorderColor: Colors.white,
                  child: Text("create account", style: redSubTitleStyle2),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: ()  {
                    if (usernameController.text != null && passwordController != null) {
                      //Sign in user then call the callback function
                      bloc.signInUser(usernameController.text, passwordController.text).then((_) {
                        widget.login();
                      });
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getSignupPage() {
    TextEditingController emailController = new TextEditingController();
    TextEditingController nameController = new TextEditingController();
    TextEditingController usernameController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page Flutter Firebase"),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          children: <Widget> [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Full Name",
              ),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "Username",
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            FlatButton(
              color: Colors.red,
              child: Text("Sign up FOR GOD SAKE"),
              onPressed: () {
                if (usernameController.text != null || passwordController.text != null || nameController.text != null || emailController.text != null) {
                  bloc.registerUser(usernameController.text, nameController.text, nameController.text, emailController.text, passwordController.text).then((_) {
                    widget.login();
                  });
                } else {
                  _showDialog();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  void saveApiKey(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("API_KEY", user.api_key);
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
