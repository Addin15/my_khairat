import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:my_khairat/config/config.dart';
import 'package:my_khairat/config/secure_storage.dart';
import 'package:my_khairat/constants/headers.dart';
import 'package:my_khairat/models/claim.dart';

class ClaimController {
  // Add dependent
  static Future<dynamic> addClaim(String claim_id, Claim claim) async {
    try {
      SecureStorage _secureStorage = SecureStorage();
      String _token = await _secureStorage.read('token');

      String url = '${Config.hostName}/claim/add';

      Map<String, dynamic> data = {
        'claim_id': claim_id,
        'claimer_name': claim.claimer_name,
        'claimer_ic': claim.claimer_ic,
        'claimer_village': claim.claimer_village,
        'claimer_url': claim.claimer_url,
        'status': claim.status,
      };

      var response = await post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: headerswithToken(_token),
      );

      log(response.body);

      if (response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);

        return Claim.fromMap(data);
      }

      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
