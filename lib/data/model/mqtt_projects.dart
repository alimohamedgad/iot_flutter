// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MqttProjectsModel {
  final String nameProject;
  final String token;
  MqttProjectsModel({
    required this.nameProject,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nameProject': nameProject,
      'token': token,
    };
  }

  factory MqttProjectsModel.fromMap(Map<String, dynamic> map) {
    return MqttProjectsModel(
      nameProject: map['nameProject'] as String,
      token: map['token'] as String,
    );
  }
}

List<MqttProjectsModel> projectMQTTList = [];
