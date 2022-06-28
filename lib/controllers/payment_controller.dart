import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_khairat/config/config.dart';
import 'package:my_khairat/config/secure_storage.dart';
import 'package:my_khairat/constants/headers.dart';
import 'package:my_khairat/models/payment.dart';

class PaymentController {
  static Future<Payment?> makePayment(String userID, XFile image) async {
    try {
      SecureStorage _secureStorage = SecureStorage();
      String _token = await _secureStorage.read('token');
      String url = '${Config.hostName}/payment/add';

      var request = MultipartRequest('POST', Uri.parse(url))
        ..fields.addAll({
          'payer_id': userID,
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
