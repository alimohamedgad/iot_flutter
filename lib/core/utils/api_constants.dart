import 'dart:convert';
import 'dart:math';

const String createAndGetProjectEndPoint = 'projects';
const String getAllUserOFProjectEndPoint = '/projects/:id/users';
const String getOwnerProjectEndPoint = '/projects/:id/owner';
const String getOneProjectEndPoint = '/projects/:id/users';
const String baseUrl = 'https://iot-platform.onrender.com/api/';
String getRandString() {
  var random = Random.secure();
  var values = List<int>.generate(64, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}
