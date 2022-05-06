class Person {
  String? name;
  String? ic;
  String? address;
  String? phone;
  String? occupation;

  Person({this.name, this.ic, this.address, this.phone, this.occupation});

  factory Person.fromMap(Map<String, dynamic> map) => Person(
        name: map['name'],
        ic: map['ic'],
        address: map['address'] ?? '',
        phone: map['phone'] ?? '',
        occupation: map['occupation'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'ic': ic,
        'address': address ?? '',
        'phone': phone ?? '',
        'occupation': occupation ?? '',
      };
}
