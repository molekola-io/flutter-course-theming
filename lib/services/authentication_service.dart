import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:molekola/main.dart';
import 'package:molekola/models/account_model.dart';
import 'package:molekola/models/heading_model.dart';
import 'package:molekola/services/heading_service.dart';

class AuthenticationService {
  static Future<Account> authenticate(String email, String password) async {
    print("Authentication Attempted $email");

    String parameters =
        jsonEncode(<String, String>{"email": email, "password": password});

    final http.Response response = await http.post(
        "https://api.sevendaysweb.com/api/resources/profile/authenticate/",
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: parameters);

    if (response.statusCode == 200) {
      Map<String, dynamic> accountMap = json.decode(response.body);
      return _parseAccountMap(accountMap);
    } else {
      throw Exception("Failed do login ${response.reasonPhrase}, $parameters");
    }
  }

  static Account _parseAccountMap(Map<String, dynamic> accountMap) {
    Account result = Account();
    result.userId = accountMap['userId'];
    result.firstName = accountMap['firstName'];
    result.lastName = accountMap['lastName'];
    result.email = accountMap['email'];
    result.activationToken = accountMap['activationToken'];
    result.activeHeading =
        HeadingService.parseHeading(accountMap['headings'][0]);
    return result;
  }

  static String authorizationToken() {
    final String authorization =
        'Basic ${MyApp.ACCOUNT.userId}:${MyApp.ACCOUNT.activeHeading.id}:${MyApp.ACCOUNT.activationToken}';
    print("Authorization: $authorization");
    return authorization;
  }

  static void switchHeading(Heading heading) {
    MyApp.ACCOUNT.activeHeading = heading;
  }
}
