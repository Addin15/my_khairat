import 'package:my_khairat/models/person.dart';

class User extends Person {
  String? id;
  String? email;
  List<Person>? dependents;

  User({
    this.id,
    this.email,
    this.dependents,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    User user = User(
      id: map['id'],
      email: map['email'],
    );

    user.name = map['name'];
    user.ic = map['ic'];
    user.address = map['address'];
    user.phone = map['phone'];
    user.occupation = map['occupation'];

    return user;
  }
}
