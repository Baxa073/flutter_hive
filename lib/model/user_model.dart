class User {
  String firstName;
  String lastName;
  String email;
  String password;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });


  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }


  factory User.fromJson({required Map<String, dynamic> map}) {
    return User(
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      password: map['password'],
    );
  }
}