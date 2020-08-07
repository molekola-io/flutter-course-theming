import 'dart:convert';

import 'package:molekola/main.dart';
import 'package:molekola/models/heading_model.dart';
import 'package:http/http.dart' as http;
import 'package:molekola/services/authentication_service.dart';

class HeadingService {
  static Future<List<Heading>> load() async {
    final http.Response response = await http.get(
        'https://api.sevendaysweb.com/api/resources/profile/headings/',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': AuthenticationService.authorizationToken()
        });

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      print("body runtime type: ${body['headings'].runtimeType}");
      return parseHeadings(body['headings'].cast<Map<String, dynamic>>());
    } else {
      throw Exception("Failed do login ${response.reasonPhrase}");
    }
  }

  static Heading parseHeading(Map<String, dynamic> mapHeading) {
    Heading result = Heading();
    result.id = mapHeading['headingId'] is int
        ? mapHeading['headingId']
        : int.parse(mapHeading['headingId']);
    result.name = mapHeading['name'];
    result.role = mapHeading['role'];
    return result;
  }

  static List<Heading> parseHeadings(List<Map<String, dynamic>> mapHeadings) {
    return mapHeadings.map((map) => parseHeading(map)).toList();
  }
}
