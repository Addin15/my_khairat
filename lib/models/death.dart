class Death {
  String? id;
  String? userid;
  String? dependentid;
  String? name;
  String? ic;
  String? relation;
  String? phonenum;
  String? address;
  String? date;
  String? location;
  String? causes;

  Death({
    this.id,
    this.userid,
    this.dependentid,
    this.name,
    this.ic,
    this.relation,
    this.phonenum,
    this.address,
    this.date,
    this.location,
    this.causes,
  });

  factory Death.fromMap(Map<String, dynamic> map) => Death(
        id: map['death_id'].toString(),
        userid: map['user_id'].toString(),
        dependentid: map['dependent_id'].toString(),
        name: map['dependent_name'],
        ic: map['dependent_ic'],
        relation: map['dependent_relation'],
        phonenum: map['dependent_phonenum'],
        address: map['dependent_address'],
        date: map['dependent_deathdate'],
        location: map['death_location'],
        causes: map['death_causes'],
      );

  Map<String, dynamic> toMap() => {
        'death_id': id,
        'user_id': userid,
        'dependent_id': dependentid,
        'dependent_name': name,
        'dependent_ic': ic,
        'dependent_relation': relation,
        'dependent_phonenum': phonenum,
        'dependent_address': address,
        'dependent_deathdate': date,
        'death_location': location,
        'death_causes': causes,
      };
}
