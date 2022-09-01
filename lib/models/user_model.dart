class UserModel {
  final String uid;
  final String name;
  final String email;
  final bool admin;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.admin,
  });

  // factory UserModel.fromFireStore

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "email": email,
        "admin": admin,
      };
}
