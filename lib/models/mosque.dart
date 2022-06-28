import 'package:hive/hive.dart';

part 'mosque.g.dart';

@HiveType(typeId: 3)
class Mosque {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? phone;

  @HiveField(3)
  String? postcode;

  @HiveField(4)
  String? state;

  @HiveField(5)
  String? address;

  @HiveField(6)
  double? monthlyFee;

  @HiveField(7)
  String? bankName;

  @HiveField(8)
  String? bankOwnerName;

  @HiveField(9)
  String? bankAccountNo;

  Mosque({
    this.id,
    this.name,
    this.phone,
    this.postcode,
    this.state,
    this.address,
    this.monthlyFee,
    this.bankName,
    this.bankOwnerName,
    this.bankAccountNo,
  });

  factory Mosque.fromMap(Map<String, dynamic> map) => Mosque(
        id: map['mosque_id'].toString(),
        name: map['mosque_name'],
        phone: map['mosque_phone'],
        postcode: map['mosque_postcode'],
        state: map['mosque_state'],
        address: map['mosque_address'],
        monthlyFee: map['mosque_monthly_fee'].toDouble(),
        bankName: map['mosque_bank_name'],
        bankOwnerName: map['mosque_bank_owner_name'],
        bankAccountNo: map['mosque_bank_no'],
      );

  Map<String, dynamic> toMap() => {
        'mosque_id': id,
        'mosque_name': name,
        'mosque_phone': phone,
        'mosque_postcode': postcode,
        'mosque_state': state,
        'mosque_address': address,
        'mosque_monthly_fee': monthlyFee,
        'mosque_bank_name': bankName,
        'mosque_bank_owner_name': bankOwnerName,
        'mosque_bank_no': bankAccountNo,
      };
}
