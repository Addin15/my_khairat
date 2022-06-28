import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:my_khairat/config/config.dart';
import 'package:my_khairat/config/secure_storage.dart';
import 'package:my_khairat/constants/headers.dart';
import 'package:my_khairat/models/dependent.dart';

class DependentController {
  // Get all dependents
  static Future<List<DependentModel>> getDependents(String userID) async {
    try {
      SecureStorage _secureStorage = SecureStorage();
      String _token = await _secureStorage.read('token');

      String url = '${Config.hostName}/dependents/get';

      Map<String, dynamic> data = {
        'user_id': userID,
      };

      var response = await post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: headerswithToken(_token),
      );

      log(response.body);

      if (response.statusCode == 200) {
        List dependents = jsonDecode(response.body);

        return dependents
            .map((dependent) =>
                DependentModel.fromMap(dependent as Map<String, dynamic>))
            .toList();
      }

      return [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  // Add dependent
  static Future<dynamic> addDependent(
      String userID, String mosqueID, DependentModel dependent) async {
    try {
      SecureStorage _secureStorage = SecureStorage();
      String _token = await _secureStorage.read('token');

      String url = '${Config.hostName}/dependents/add';

      Map<String, dynamic> data = {
        'user_id': userID,
        'mosque_id': mosqueID,
        'dependent_name': dependent.dependent_name,
        'dependent_relation': dependent.dependent_relation,
        'dependent_ic': dependent.dependent_ic,
        'dependent_phone': dependent.dependent_phone,
        'dependent_occupation': dependent.dependent_occupation,
        'dependent_address': dependent.dependent_address,
        'death_status': dependent.death_status,
        'death_date': dependent.death_date,
        'verify': dependent.verify,
        'verify_death': dependent.verify_death,
      };

/*  this.dependent_relation,
    this.dependent_ic,
    this.dependent_phone,
    this.dependent_occupation,
    this.dependent_address,
    this.death_status,
    this.death_date,*/

      var response = await post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: headerswithToken(_token),
      );


      log(response.body);

      if (response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);

        return DependentModel.fromMap(data);
      }

      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  // Edit dependent
  static Future<dynamic> editDependent(DependentModel dependent) async {
    try {
      SecureStorage _secureStorage = SecureStorage();
      String _token = await _secureStorage.read('token');

      String url = '${Config.hostName}/dependents/edit';

      Map<String, dynamic> data = dependent.toMap();

      var response = await put(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: headerswithToken(_token),
      );

      log(response.body);

      if (response.statusCode == 200) {
        return dependent;
      }

      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  // Delete dependent
  static Future<bool> deleteDependent(DependentModel dependent) async {
    try {
      SecureStorage _secureStorage = SecureStorage();
      String _token = await _secureStorage.read('token');

      String url = '${Config.hostName}/dependents/delete';

      Map<String, dynamic> data = dependent.toMap();

      var response = await post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: headerswithToken(_token),
      );

      log(response.body);

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
