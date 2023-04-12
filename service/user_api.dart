import 'package:http/http.dart' as http;
import 'package:kws/model/user_dob_model.dart';
import 'package:kws/model/user_location.dart';
import '../../model/user_name.dart';
import 'package:kws/model/user_model.dart';
import 'dart:convert';

import '../user_image_model.dart';

class UserApi {
  static Future<List<UserModel>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=10'));

    final body = response.body;

    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      final name = UserNameModel(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      final image = ImageModel(
          large: e['picture']['large'],
          medium: e['picture']['medium'],
          thumbnail: e['picture']['thumbnail']);

      final date = e['dob']['date'];

      final dob = UserDob(
        date: DateTime.parse(date),
        age: e['dob']['age'],
      );
      final street = LocationStreet(
          number: e['location']['street']['number'],
          name: e['location']['street']['name']);
      final coordinates = LocationCordinates(
          latitude: e['location']['coordinates']['latitude'],
          longitude: e['location']['coordinates']['longitude']);

      final timezone = LocationTimeZone(
          offset: e['location']['timezone']['offset'],
          description: e['location']['timezone']['offset']);

      final location = UserLocation(
          city: e['location']['city'],
          state: e['location']['state'],
          country: e['location']['country'],
          postcode: e['location']['postcode'].toString(),
          street: street,
          coordinates: coordinates,
          timezone: timezone);

      return UserModel(
        gender: e['gender'],
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        nat: e['nat'],
        name: name,
        image: image,
        dob: dob,
        userlocation: location,
      );
    }).toList();
    return users;
  }
}
