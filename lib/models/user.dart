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

  User({
    this.id,
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
  });

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
        mosqueID: map['person']['mosque_id'] ?? '',
        villageID: map['person']['village_id'] ?? '',
      );
}
