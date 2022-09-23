class UserModel {
  final String uid;
  final String name;
  final String email;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
  });

  // factory UserModel.fromFireStore

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "email": email,
      };
}
