// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CreateProjectModel {
  final String? projectId;
  final String ownerID;
  final String projectName;
  final List? sensors;
  final String projectTyp;
  final List? users;
  final String? createdAt;
  final String? updatedAt;
  CreateProjectModel({
    this.projectId,
    required this.ownerID,
    required this.projectName,
    this.sensors,
    required this.projectTyp,
    this.users,
    this.createdAt,
    this.updatedAt,
  });

  Map toMap() {
    return {
      "_id": projectId,
      "name": projectName,
      "owner": ownerID,
      "project_type": projectTyp,
      "sensors": sensors,
      "users": users,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }

  factory CreateProjectModel.fromMap(dynamic map) {
    return CreateProjectModel(
      projectName: map['name'] ?? 'Home',
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      projectId: map['_id'],
      ownerID: map['owner'],
      sensors: List.from((map['sensors']) ?? []),
      projectTyp: map['project_type'] as String,
      users: List.from(
        (map['users'] ?? []),
      ),
    );
  }
}
