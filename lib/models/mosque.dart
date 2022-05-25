class Mosque {
  String? id;
  String? name;
  String? phone;
  String? postcode;
  String? state;
  String? address;

  Mosque({
    this.id,
    this.name,
    this.phone,
    this.postcode,
    this.state,
    this.address,
  });

  factory Mosque.fromMap(Map<String, dynamic> map) => Mosque(
        id: map['mosque_id'].toString(),
        name: map['mosque_name'],
        phone: map['mosque_phone'],
        postcode: map['mosque_postcode'],
        state: map['mosque_state'],
        address: map['mosque_address'],
      );

  Map<String, dynamic> toMap() => {
        'mosque_id': id,
        'mosque_name': name,
        'mosque_phone': phone,
        'mosque_postcode': postcode,
        'mosque_state': state,
        'mosque_address': address,
      };
}
