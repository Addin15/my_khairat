import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:my_khairat/config/config.dart';
import 'package:my_khairat/config/secure_storage.dart';
import 'package:my_khairat/constants/headers.dart';

class MosqueController {
  static getMosques() async {
    try {
      String url = '${Config.hostName}/mosque/all';

      var response = await get(Uri.parse(url), headers: headersWithoutToken());

      log(response.body);

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        log('return');
        return data;
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static getVillages(String mosqueID) async {
    try {
      String url = '${Config.hostName}/mosque/$mosqueID/village/all';

      var response = await get(Uri.parse(url), headers: headersWithoutToken());

      log(response.body);

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

}
