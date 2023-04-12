// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCordinates coordinates;
  final LocationTimeZone timezone;
  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.street,
    required this.coordinates,
    required this.timezone,
  });
}

class LocationStreet {
  final int number;
  final String name;
  LocationStreet({
    required this.number,
    required this.name,
  });
}

class LocationCordinates {
  final String latitude;
  final String longitude;
  LocationCordinates({
    required this.latitude,
    required this.longitude,
  });
}

class LocationTimeZone {
  final String offset;
  final String description;
  LocationTimeZone({
    required this.offset,
    required this.description,
  });
}
