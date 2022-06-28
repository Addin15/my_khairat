import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_khairat/config/config.dart';
import 'package:my_khairat/config/secure_storage.dart';
import 'package:my_khairat/constants/headers.dart';
import 'package:my_khairat/models/claim.dart';

class ClaimController {
// Get all dependents
  static Future<List<Claim>> getClaim(String claimId) async {
    try {
      SecureStorage _secureStorage = SecureStorage();
      String _token = await _secureStorage.read('token');

      String url = '${Config.hostName}/claims/get';

      Map<String, dynamic> data = {
        'claim_id': claimId,
      };

      var response = await post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: headerswithToken(_token),
      );

      log(response.body);

      if (response.statusCode == 200) {
        List claims = jsonDecode(response.body);

        return claims
            .map((claim) => Claim.fromMap(claim as Map<String, dynamic>))
            .toList();
      }

      return [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  // Add claim
  static Future<dynamic> addClaim(
      String claimID, String mousqueID, Claim claim, XFile image) async {
    try {
      SecureStorage _secureStorage = SecureStorage();
      String _token = await _secureStorage.read('token');

      String url = '${Config.hostName}/claims/add';
      log(claimID);

      Map<String, String> data = {
        'claim_id': claimID,
        'mosque_id': mousqueID,
        'claimer_name': claim.claimername!,
        'claimer_ic': claim.claimeric!,
        'claimer_address': claim.claimeraddress!,
        'claimer_relation': claim.claimerrelation!,
        'dead_name': claim.deadname!,
        'dead_date': claim.deaddate!,
        'dead_reason': claim.deadreason!,
        'status': claim.status!,
      };

      var request = MultipartRequest('POST', Uri.parse(url))
        ..fields.addAll(data)
        ..headers.addAll({
          'Content-Type': 'multipart/form-data',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + _token,
        })
        ..files.add(await MultipartFile.fromPath('image', image.path));

      StreamedResponse stream = await request.send();

      var response = await Response.fromStream(stream);

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
