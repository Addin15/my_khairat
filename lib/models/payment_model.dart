import 'package:my_khairat/utils/constant.dart';

class PaymentModel {
  int? id;
  String? month;
  int? year;
  String? proof;
  String? status;
  double? amount;

  PaymentModel({
    this.id,
    this.month,
    this.year,
    this.proof,
    this.status,
    this.amount,
  });

  factory PaymentModel.fromMap(Map<String, dynamic> map) => PaymentModel(
        id: map['id'],
        month: Constant.months[map['month']],
        year: map['year'],
        proof: map['proof'],
        status: map['status'],
        amount: map['amount'],
      );
}
