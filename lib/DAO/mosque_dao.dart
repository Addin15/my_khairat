import 'package:flutter/cupertino.dart';
import 'package:my_khairat/controllers/mosque_controller.dart';
import 'package:my_khairat/models/mosque.dart';
import 'package:my_khairat/models/village.dart';

class MosqueDAO extends ChangeNotifier {
  List<Mosque> _mosques = [];
  List<Village> _villages = [];
  List<Mosque> _mosquesAccept = [];

  List<Mosque> get mosques => _mosques;

  List<Village> get villages => _villages;

  List<Mosque> get mosquesAccept => _mosquesAccept;

  MosqueDAO() {
    initData();
  }

  initData() async {
    List res = await MosqueController.getMosques();

    List res2 = await MosqueController.getAcceptedMosques();

    List<Mosque> data = res.map((mosque) => Mosque.fromMap(mosque)).toList();

    List<Mosque> data2 = res2.map((mosque) => Mosque.fromMap(mosque)).toList();

    _mosques = data;

    _mosquesAccept = data2;
    
    notifyListeners();
  }

  getVillages(String mosqueID) async {
    List res = await MosqueController.getVillages(mosqueID);

    List<Village> data =
        res.map((village) => Village.fromMap(village)).toList();

    _villages = data;
    notifyListeners();
  }

  Future<Map<String, dynamic>> getMosqueAndVillage(
    String mosqueID,
    String villageID,
  ) async {
    Mosque? mosque = await MosqueController.getMosque(mosqueID);
    Village? village = await MosqueController.getVillage(villageID);

    return {
      'mosque': mosque,
      'village': village,
    };
  }
}
