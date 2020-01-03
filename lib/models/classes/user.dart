class User {
  String username;
  String firstname;
  String lastname;
  String email_address;
  String password;
  String api_key;
  int id;

  User (this.username, this.firstname, this.lastname, this.email_address, this.password, this.api_key, this.id);

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      parsedJson['username'],
      parsedJson['firstname'],
      parsedJson['lastname'],
      parsedJson['email_address'],
      parsedJson['password'],
      parsedJson['api_key'],
      parsedJson['id']);
  }
}