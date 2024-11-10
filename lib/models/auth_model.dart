class RegisterModel {
  String name;
  String email;
  String phone;
  String password;

  RegisterModel(
      {required this.name, required this.email, required this.phone, required this.password});

  factory RegisterModel.fromMap(Map<String, dynamic>map){
    return RegisterModel(name: map['name'],
        email: map['email'],
        phone: map['mobile_number'],
        password: map['password']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name' : name,
      'email' : email,
      'mobile_number' : phone,
      'password' : password
    };
  }
}

class LoginModel {
  String email;
  String password;

  LoginModel(
      {required this.email, required this.password});

  factory LoginModel.fromMap(Map<String, dynamic>map){
    return LoginModel(email: map['email'], password: map['password']);

  }

  Map<String, dynamic> toMap() {
    return {
      'email' : email,
      'password' : password
    };
  }
}