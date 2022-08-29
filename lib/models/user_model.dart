class UserModel {
  String? uid;
  String? name;
  String? email;
  bool? role;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.role,
  });

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      role: map['role'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'role': role,
    };
  }
}
