import 'package:flutter/cupertino.dart';
import 'package:my_khairat/controllers/death_controller.dart';
import 'package:my_khairat/models/death.dart';

class DeathDAO extends ChangeNotifier {
  List<Death> _deaths = [];

  DeathDAO(String dependentID) {
    initData(dependentID);
  }
  get deaths => _deaths;

  initData(String dependentID) async {
    List<Death> deaths = await DeathController.getDeaths(dependentID);

    _deaths = deaths;
    notifyListeners();
  }

  addDeath(String dependentID, Death death) async {
    dynamic data = await DeathController.addDeath(dependentID, death);

    if (data != null) {
      _deaths.add(data);
      notifyListeners();
    }
  }
}
