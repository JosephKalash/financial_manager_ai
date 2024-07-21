class AuthParams {
  String? email;
  String? password;

  AuthParams({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory AuthParams.fromJson(Map<String, dynamic> json) {
    return AuthParams(
      email: json['email'],
      password: json['password'],
    );
  }
}
