import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 0)
class Person extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? ic;

  @HiveField(3)
  String? address;

  @HiveField(4)
  String? phone;

  @HiveField(5)
  String? occupation;

  @HiveField(6)
  String? status;

  Person({
    this.id,
    this.name,
    this.ic,
    this.address,
    this.phone,
    this.occupation,
    this.status,
  });

  factory Person.fromMap(Map<String, dynamic> map) => Person(
      id: map['id'].toString(),
      name: map['person_name'],
      ic: map['person_ic'],
      address: map['person_address'] ?? '',
      phone: map['person_phone'] ?? '',
      occupation: map['person_occupation'] ?? '',
      status: map['person_status']);

  Map<String, dynamic> toMap() => {
        'id': id,
        'person_name': name,
        'person_ic': ic,
        'person_address': address ?? '',
        'person_phone': phone ?? '',
        'person_occupation': occupation ?? '',
        'person_status': status ?? '',
      };
}
