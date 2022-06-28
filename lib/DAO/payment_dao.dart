import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_khairat/controllers/payment_controller.dart';
import 'package:my_khairat/models/payment.dart';

class PaymentDAO extends ChangeNotifier {
  List<Payment> _payments = [];

  List<Payment> get payments => _payments;

  PaymentDAO(String userID) {
    initData(userID);
  }

  initData(String userID) async {
    List<Payment> data = await PaymentController.getPayments(userID);

    _payments = data;
    notifyListeners();
  }

  Future<bool> makePayment(String userID, String mosqueID, XFile image) async {
    Payment? res = await PaymentController.makePayment(userID, mosqueID, image);

    if (res != null) {
      _payments.add(res);
      notifyListeners();

      return true;
    }

    return false;
  }
}
