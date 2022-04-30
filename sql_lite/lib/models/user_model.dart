class UserModel {
  int id;
  String email;
  String lastName;
  String password;
  String name;
  int state;

  UserModel(
    this.id,
    this.email,
    this.lastName,
    this.password,
    this.name,
    this.state,
  );
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'lastName': lastName,
      'password': password,
      'name': name,
      'state': state,
    };
  }
}
