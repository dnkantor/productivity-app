import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:be_productive/models/classes/user.dart';

class UserBloc {
  final _repository = Repository();
  final _userGetter = PublishSubject<User>();

  Observable<User> get getUser => _userGetter.stream;

  registerUser(String username, String firstname, String lastname, String email_address, String password) async {
    User userModel = await _repository.registerUser(username, firstname, lastname, email_address, password);
    _userGetter.sink.add(userModel);
  }

  signInUser(String username, String password) async {
    User userModel = await _repository.signInUser(username, password);
    _userGetter.sink.add(userModel);
  }

  dispose() {
    _userGetter.close();
  }
}

final bloc = UserBloc();