class Authentication {
  int? status;
  String? message;
  Data? data;

  Authentication({this.status, this.message, this.data});

  Authentication.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  String? accessToken;
  String? tokenType;

  Data({this.user, this.accessToken, this.tokenType});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? address;
  String? phone;
  String? image;
  int? isAdmin;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? locale;

  User(
      {this.id,
        this.name,
        this.email,
        this.address,
        this.phone,
        this.image,
        this.isAdmin,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.locale});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    phone = json['phone'];
    image = json['image'];
    isAdmin = json['is_admin'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    locale = json['locale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['address'] = address;
    data['phone'] = phone;
    data['image'] = image;
    data['is_admin'] = isAdmin;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['locale'] = locale;
    return data;
  }
}