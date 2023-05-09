import 'package:hive/hive.dart';
import 'package:my_khairat/models/person.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? personID;

  @HiveField(2)
  String? email;

  @HiveField(3)
  String? name;

  @HiveField(4)
  String? ic;

  @HiveField(5)
  String? address;

  @HiveField(6)
  String? phone;

  @HiveField(7)
  String? occupation;

  @HiveField(8)
  String? status;

  @HiveField(9)
  String? mosqueID;

  @HiveField(10)
  String? villageID;

  @HiveField(11)
  int? expireMonth;

  @HiveField(12)
  int? expireYear;

  @HiveField(13)
  String? registerDate;

  @HiveField(14)
  int? person_member_no;

  User(
      {this.id,
      this.personID,
      this.email,
      this.name,
      this.ic,
      this.address,
      this.phone,
      this.occupation,
      this.status,
      this.mosqueID,
      this.villageID,
      this.expireMonth,
      this.expireYear,
      this.registerDate,
      this.person_member_no});

  factory User.fromMap(Map<String, dynamic> map) => User(
        id: map['user']['id'].toString(),
        email: map['user']['email'],
        personID: map['person']['id'].toString(),
        name: map['person']['person_name'] ?? '',
        ic: map['person']['person_ic'] ?? '',
        address: map['person']['person_address'] ?? '',
        phone: map['person']['person_phone'] ?? '',
        occupation: map['person']['person_occupation'] ?? '',
        status: map['person']['person_status'] ?? '',
        mosqueID: map['person']['mosque_id'] == null
            ? ''
            : map['person']['mosque_id'].toString(),
        villageID: map['person']['village_id'] == null
            ? ''
            : map['person']['village_id'].toString(),
        expireMonth: map['person']['person_expire_month'],
        expireYear: map['person']['person_expire_year'],
        registerDate: map['person']['person_register_date'],
        person_member_no: map['person']['person_member_no'],
      );
}
