// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kws/model/user_dob_model.dart';
import 'package:kws/model/user_image_model.dart';
import 'package:kws/model/user_location.dart';

import 'user_name.dart';

class UserModel {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserNameModel name;
  final ImageModel image;
  final UserDob dob;
  final UserLocation userlocation;
  UserModel(
      {required this.gender,
      required this.email,
      required this.phone,
      required this.cell,
      required this.nat,
      required this.name,
      required this.image,
      required this.dob,
      required this.userlocation});

  String get fullName {
    return ' ${name.title} ${name.first} ${name.last}';
  }
}
