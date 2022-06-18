import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:my_khairat/config/config.dart';
import 'package:my_khairat/config/secure_storage.dart';
import 'package:my_khairat/constants/headers.dart';
import 'package:my_khairat/models/death.dart';

class DeathController {
  // Get all deaths
  static Future<List<Death>> getDeaths(String dependentID) async {
    try {
      SecureStorage _secureStorage = SecureStorage();
      String _token = await _secureStorage.read('token');

      String url = '${Config.hostName}/dependents/deaths/get';

      Map<String, dynamic> data = {
        'dependent_id': dependentID,
      };

      var response = await post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: headerswithToken(_token),
      );

      log(response.body);

      if (response.statusCode == 200) {
        List deaths = jsonDecode(response.body);

        return deaths
            .map((death) => Death.fromMap(death as Map<String, dynamic>))
            .toList();
      }

      return [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  // Add new death
  static Future<dynamic> addDeath(String dependentID, Death death) async {
    try {
      SecureStorage _secureStorage = SecureStorage();
      String _token = await _secureStorage.read('token');

      String url = '${Config.hostName}/dependents/deaths/add';

      Map<String, dynamic> data = {
        'user_id': death.userid,
        'dependent_id': dependentID,
        'dependent_name': death.name,
        'dependent_ic': death.ic,
        'dependent_relation': death.relation,
        'dependent_phonenum': death.phonenum,
        'dependent_address': death.address,
        'dependent_deathdate': death.date,
        'death_location': death.location,
        'death_causes': death.causes,
      };

      var response = await post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: headerswithToken(_token),
      );

      log(response.body);

      if (response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return Death.fromMap(data);
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
