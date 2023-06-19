
class UserName {
  static final UserName _instance = UserName._internal();
  factory UserName() => _instance;

  UserName._internal();

  String username = 'Name';
}
