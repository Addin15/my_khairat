import 'package:flutter/material.dart';
import 'package:my_khairat/config/secure_storage.dart';
import 'package:my_khairat/controllers/claim_controller.dart';
import 'package:my_khairat/models/claim.dart';

class ClaimDAO extends ChangeNotifier {
  List<Claim> _claim = [];

  ClaimDAO() {
    initData();
  }

  initData() async {
    SecureStorage _secureStorage = SecureStorage();
    String? _token = await _secureStorage.read('token');
    
    notifyListeners();
  }

  addClaim(String claimID,String mosqueID, Claim claim) async {
    dynamic data = await ClaimController.addClaim(claimID, mosqueID, claim);

    if (data != null) {
      _claim.add(data);
      notifyListeners();
    }
  }
}
