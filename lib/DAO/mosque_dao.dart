import 'package:flutter/cupertino.dart';
import 'package:my_khairat/controllers/mosque_controller.dart';
import 'package:my_khairat/models/mosque.dart';
import 'package:my_khairat/models/village.dart';

class MosqueDAO extends ChangeNotifier {
  List<Mosque> _mosques = [];
  List<Village> _villages = [];

  get mosques => _mosques;

  get villages => _villages;

  MosqueDAO() {
    initData();
  }

  initData() async {
    List res = await MosqueController.getMosques();

    List<Mosque> data = res.map((mosque) => Mosque.fromMap(mosque)).toList();

    _mosques = data;
    notifyListeners();
  }

  getVillages(String mosqueID) async {
    List res = await MosqueController.getVillages(mosqueID);

    List<Village> data =
        res.map((village) => Village.fromMap(village)).toList();

    _villages = data;
    notifyListeners();
  }
}
