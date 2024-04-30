class UserModel {
  late String idUser;
  late String name;
  late String email;
  late String password;

  UserModel({
    required this.idUser,
    required this.name,
    required this.email,
    required this.password,
  });


  UserModel.fromMap(Map<String, dynamic> map) {
    idUser = map['idUser'];
    name = map['name'];
    email = map['email'];
    password = map['password'];
  }
  Map<String, dynamic> toMap() {
    return {
      'idUser':idUser,
      'name': name,
      'email': email,
      'password':password,

    };
  }
}