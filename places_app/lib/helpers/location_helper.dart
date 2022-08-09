import '../api_key.dart';

const apiKey = GOOGLE_API_KEY;

class LocationHelper {
  static String generateLocationImagePreview({
    double latitude,
    double longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$apiKey';
  }
}
