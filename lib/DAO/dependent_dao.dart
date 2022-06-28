import 'package:flutter/cupertino.dart';
import 'package:my_khairat/controllers/dependent_controller.dart';
import 'package:my_khairat/models/dependent.dart';

class DependentDAO extends ChangeNotifier {
  List<DependentModel> _dependents = [];

  DependentDAO(String userID) {
    initData(userID);
  }

  get dependents => _dependents;

  initData(String userID) async {
    List<DependentModel> dependents =
        await DependentController.getDependents(userID);

    // TODO Cache with hive

    _dependents = dependents;
    notifyListeners();
  }

  addDependent(String userID, String mosqueID, DependentModel dependent) async {
    dynamic data = await DependentController.addDependent(userID, mosqueID, dependent);

    if (data != null) {
      _dependents.add(data);
      notifyListeners();
    }
  }

  editDependent(DependentModel dependent) async {
    dynamic data = await DependentController.editDependent(dependent);

    if (data != null) {
      int index = _dependents.indexWhere((d) => d.user_id == dependent.user_id);
      _dependents[index] = dependent;

      notifyListeners();
    }
  }

  deleteDependent(DependentModel dependent) async {
    bool res = await DependentController.deleteDependent(dependent);

    if (res) {
      _dependents.remove(dependent);

      notifyListeners();
    }
  }
}
