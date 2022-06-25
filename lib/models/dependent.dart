import 'dart:ffi';

class DependentModel {
  String? id;
  String? user_id;
  String? dependent_name;
  String? dependent_relation;
  String? dependent_ic;
  String? dependent_phone;
  String? dependent_occupation;
  String? dependent_address;
  String? death_status;
  String? death_date;
  String? verify;


  DependentModel({
    this.id,
    this.user_id,
    this.dependent_name,
    this.dependent_relation,
    this.dependent_ic,
    this.dependent_phone,
    this.dependent_occupation,
    this.dependent_address,
    this.death_status,
    this.death_date,
    this.verify,
  });

  factory DependentModel.fromMap(Map<String, dynamic> map) => DependentModel(
    id: map['id'].toString(),
    user_id: map['user_id'].toString(),
    dependent_name: map['dependent_name'],
    dependent_relation: map['dependent_relation'],
    dependent_ic: map['dependent_ic'],
    dependent_phone: map['dependent_phone'],
    dependent_occupation: map['dependent_occupation'],
    dependent_address: map['dependent_address'],
    death_status: map['death_status'],
    death_date: map['death_date'],
    verify: map['verify'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'user_id': user_id,
    'dependent_name': dependent_name,
    'dependent_relation': dependent_relation,
    'dependent_ic': dependent_ic,
    'dependent_phone': dependent_phone,
    'dependent_occupation': dependent_occupation,
    'dependent_address': dependent_address,
    'death_status': death_status,
    'death_date': death_date,
    'verify': verify,
  };
}
