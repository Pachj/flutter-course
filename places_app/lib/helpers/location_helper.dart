import '../api_key.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = GOOGLE_API_KEY;

class LocationHelper {
  static String generateLocationImagePreview({
    double latitude,
    double longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$apiKey';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final params = {
      'latlng': '$lat,$lng',
      'key': apiKey,
    };
    final url =
        Uri.https('maps.googleapis.com', '/maps/api/geocode/json', params);

    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
