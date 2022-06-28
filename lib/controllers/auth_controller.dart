import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_khairat/config/config.dart';
import 'package:my_khairat/config/secure_storage.dart';
import 'package:my_khairat/constants/headers.dart';
import 'package:my_khairat/models/person.dart';

class AuthController {
  // Register
  static Future<dynamic> register(
      {required String email,
      required String ic,
      required String password}) async {
    try {
      String url = '${Config.hostName}/register';

      var response = await post(Uri.parse(url),
          body: jsonEncode({
            'email': email,
            'ic': ic,
            'password': password,
          }),
          headers: headersWithoutToken());

      log(response.body);

      if (response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return data;
      }

      return null;
    } catch (e) {
      log('register' + e.toString());
      return null;
    }
  }

  // Login
  static Future<dynamic> login(
      {required String email, required String password}) async {
    try {
      String url = '${Config.hostName}/login';

      var response = await post(Uri.parse(url),
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
          headers: headersWithoutToken());

      log(response.body);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return data;
      }

      return null;
    } catch (e) {
      log('login' + e.toString());
      return null;
    }
  }

  // Complete profile
  static Future<bool> complete({
    required Map<String, String> data,
    XFile? paymentProve,
    XFile? addressProve,
  }) async {
    try {
      SecureStorage _secureStorage = SecureStorage();
      String _token = await _secureStorage.read('token');
      String url = '${Config.hostName}/complete';

      // var response = await put(
      //   Uri.parse(url),
      //   body: jsonEncode(data),
      //   headers: headerswithToken(_token),
      // );

      var request = MultipartRequest('POST', Uri.parse(url))
        ..fields.addAll(data)
        ..headers.addAll({
          'Content-Type': 'multipart/form-data',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + _token,
        })
        ..files.add(
            await MultipartFile.fromPath('paymentProve', paymentProve!.path))
        ..files.add(
            await MultipartFile.fromPath('addressProve', addressProve!.path));

      StreamedResponse stream = await request.send();

      var response = await Response.fromStream(stream);

      log(response.body);

      if (response.statusCode == 201) {
        if (jsonDecode(response.body) == 1) {
          return true;
        }
      }

      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<dynamic> getProfile(String userID) async {
    try {
      SecureStorage _secureStorage = SecureStorage();
      String _token = await _secureStorage.read('token');
      String url = '${Config.hostName}/user';

      var response = await post(
        Uri.parse(url),
        body: jsonEncode({
          'id': userID,
        }),
        headers: headerswithToken(_token),
      );

      log(response.body);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return data;
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  // Log out
  static Future<bool> logout() async {
    try {
      SecureStorage _secureStorage = SecureStorage();
      String _token = await _secureStorage.read('token');
      String url = '${Config.hostName}/logout';

      var response = await post(
        Uri.parse(url),
        headers: headerswithToken(_token),
      );

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['isLogOut'] == true) return true;
      }

      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
