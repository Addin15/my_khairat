import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_khairat/config/config.dart';
import 'package:my_khairat/config/secure_storage.dart';
import 'package:my_khairat/constants/headers.dart';
import 'package:my_khairat/models/payment.dart';

class PaymentController {
  static Future<List<Payment>> getPayments(String userID) async {
    try {
      SecureStorage _secureStorage = SecureStorage();
      String _token = await _secureStorage.read('token');
      String url = '${Config.hostName}/payment/get';

      var data = {
        'payer_id': userID,
      };

      var response = await post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: headerswithToken(_token),
      );

      log(response.body);

      if (response.statusCode == 201) {
        List data = jsonDecode(response.body);

        return data.map((payment) => Payment.fromMap(payment)).toList();
      }

      return [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static Future<Payment?> makePayment(
      String userID, String mosqueID, XFile image) async {
    try {
      SecureStorage _secureStorage = SecureStorage();
      String _token = await _secureStorage.read('token');
      String url = '${Config.hostName}/payment/add';

      var request = MultipartRequest('POST', Uri.parse(url))
        ..fields.addAll({
          'payer_id': userID,
          'mosque_id': mosqueID,
        })
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

        return Payment.fromMap(data);
      }

      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
