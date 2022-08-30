class UserModel {
  String? uid;
  String? name;
  String? email;
  bool? admin;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.admin,
  });

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      admin: map['admin'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'admin': admin,
    };
  }
}
