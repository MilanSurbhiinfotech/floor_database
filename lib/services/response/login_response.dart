class LoginResponse {
  String? message;
  int? code;
  User? user;

  LoginResponse({this.message, this.code, this.user});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}


class User {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? address;
  String? designation;
  String? password;
  String? roleId;
  String? status;
  String? isStatus;
  String? registerDate;
  String? createdAt;
  List<String>? token;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.address,
        this.designation,
        this.password,
        this.roleId,
        this.status,
        this.isStatus,
        this.registerDate,
        this.createdAt,
        this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    designation = json['designation'];
    password = json['password'];
    roleId = json['role_id'];
    status = json['status'];
    isStatus = json['is_status'];
    registerDate = json['register_date'];
    createdAt = json['created_at'];
    token = json['token'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['designation'] = this.designation;
    data['password'] = this.password;
    data['role_id'] = this.roleId;
    data['status'] = this.status;
    data['is_status'] = this.isStatus;
    data['register_date'] = this.registerDate;
    data['created_at'] = this.createdAt;
    data['token'] = this.token;
    return data;
  }
}