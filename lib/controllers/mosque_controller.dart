import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:my_khairat/config/config.dart';
import 'package:my_khairat/config/secure_storage.dart';
import 'package:my_khairat/constants/headers.dart';
import 'package:my_khairat/models/mosque.dart';
import 'package:my_khairat/models/village.dart';

class MosqueController {
  static getMosques() async {
    try {
      String url = '${Config.hostName}/mosque/all';

      var response = await get(Uri.parse(url), headers: headersWithoutToken());

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static getAcceptedMosques() async {
    try {
      String url = '${Config.hostName}/mosque/accepted';

      var response = await get(Uri.parse(url), headers: headersWithoutToken());

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
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

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static Future<Mosque?> getMosque(String mosqueID) async {
    try {
      String url = '${Config.hostName}/mosque/$mosqueID';

      var response = await get(Uri.parse(url), headers: headersWithoutToken());

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return Mosque.fromMap(data);
      }

      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Village?> getVillage(String villageID) async {
    try {
      String url = '${Config.hostName}/village/$villageID';

      var response = await get(Uri.parse(url), headers: headersWithoutToken());

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return Village.fromMap(data);
      }

      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
