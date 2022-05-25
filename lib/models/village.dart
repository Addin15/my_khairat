class Village {
  String? id;
  String? name;
  String? address;

  Village({this.id, this.name, this.address});

  factory Village.fromMap(Map<String, dynamic> map) => Village(
        id: map['id'].toString(),
        name: map['village_name'],
        address: map['village_address'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'village_name': name,
        'village_address': address,
      };
}
