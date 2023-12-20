// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthModel {
  final String email;
  final String? password;
  final String name;
  final String phone;
  final String? id;
  final String? token;
  AuthModel({
    required this.email,
    this.password,
    required this.name,
    required this.phone,
    this.id,
    this.token,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'fullname': name,
      'phone': phone,
      '_id': id,
      'token': token,
    };
  }

  factory AuthModel.fromJson(dynamic map) {
    return AuthModel(
      id: map['_id'],
      email: map['email'] as String,
      password: map['password'] as String,
      name: map['fullname'] as String,
      phone: map['phone'] as String,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }
}
