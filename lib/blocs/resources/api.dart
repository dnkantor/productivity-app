import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:be_productive/models/classes/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  Client client = Client();

  Future<User> registerUser(String username, String firstname, String lastname, String email_address, String password) async {
    print("entered");
    final response = await client
      .post("http://127.0.0.1:5000/api/Signup",
      //headers: {},
      body: jsonEncode({
        "username" : username,
        "first_name" : firstname,
        "last_name" : lastname,
        "password" : password,
        "email_address" : email_address
      })
    );
    final Map result = json.decode(response.body);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      await saveApiKey(result["data"]["api_key"]);
      return User.fromJson(result["data"]);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future signInUser(String username, String password) async {
    final response = await client
      .post("http://127.0.0.1:5000/api/signin",
      //headers: {},
      body: jsonEncode({
        "username" : username,
        "password" : password
      })
    );
    final Map result = json.decode(response.body);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      await saveApiKey(result["data"]["api_key"]);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  saveApiKey (String apiKey) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("API_KEY", apiKey);
  }
}