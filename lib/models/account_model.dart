import 'package:molekola/models/heading_model.dart';

class Account {
  int _userId;
  int get userId => _userId;
  set userId(int val) => _userId = val;

  String _email;
  String get email => _email;
  set email(String val) => _email = val;

  String _firstName;
  String get firstName => _firstName;
  set firstName(String val) => _firstName = val;

  String _lastName;
  String get lastName => _lastName;
  set lastName(String val) => _lastName = val;

  String _activationToken;
  String get activationToken => _activationToken;
  set activationToken(String val) => _activationToken = val;

  Heading _activeHeading;
  Heading get activeHeading => _activeHeading;
  set activeHeading(Heading val) => _activeHeading = val;
}
