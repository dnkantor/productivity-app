import 'dart:async';
import 'api.dart';
import 'package:be_productive/models/classes/user.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<User> registerUser(String username, String firstname, String lastname, String email_address, String password)
           => apiProvider.registerUser(username, firstname, lastname, email_address, password);

  Future<User> signInUser(String username, String password)
           => apiProvider.signInUser(username, password);
}