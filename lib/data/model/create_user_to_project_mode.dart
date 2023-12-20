class CreateUserToProject {
  String? message;
  ProjectData? projectData;
  NewUserData? newUserData;

  CreateUserToProject({
    this.message,
    this.projectData,
    this.newUserData,
  });

  CreateUserToProject.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    projectData = (json['projectData'] as Map<String, dynamic>?) != null
        ? ProjectData.fromJson(json['projectData'] as Map<String, dynamic>)
        : null;
    newUserData = (json['newUserData'] as Map<String, dynamic>?) != null
        ? NewUserData.fromJson(json['newUserData'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['message'] = message;
    json['projectData'] = projectData?.toJson();
    json['newUserData'] = newUserData?.toJson();
    return json;
  }
}

class ProjectData {
  String? id;
  String? name;
  String? owner;
  List<dynamic>? sensors;
  String? projectType;
  List<Users>? users;
  String? createdAt;
  String? updatedAt;
  int? v;

  ProjectData({
    this.id,
    this.name,
    this.owner,
    this.sensors,
    this.projectType,
    this.users,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  ProjectData.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    name = json['name'] as String?;
    owner = json['owner'] as String?;
    sensors = json['sensors'] as List?;
    projectType = json['project_type'] as String?;
    users = (json['users'] as List?)
        ?.map((dynamic e) => Users.fromJson(e as Map<String, dynamic>))
        .toList();
    createdAt = json['createdAt'] as String?;
    updatedAt = json['updatedAt'] as String?;
    v = json['__v'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['_id'] = id;
    json['name'] = name;
    json['owner'] = owner;
    json['sensors'] = sensors;
    json['project_type'] = projectType;
    json['users'] = users?.map((e) => e.toJson()).toList();
    json['createdAt'] = createdAt;
    json['updatedAt'] = updatedAt;
    json['__v'] = v;
    return json;
  }
}

class Users {
  String? userID;
  String? role;
  String? id;

  Users({
    this.userID,
    this.role,
    this.id,
  });

  Users.fromJson(Map<String, dynamic> json) {
    userID = json['userID'] as String?;
    role = json['role'] as String?;
    id = json['_id'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['userID'] = userID;
    json['role'] = role;
    json['_id'] = id;
    return json;
  }
}

class NewUserData {
  String? fullname;
  String? email;
  String? password;
  String? phone;
  String? role;
  String? id;
  int? v;

  NewUserData({
    this.fullname,
    this.email,
    this.password,
    this.phone,
    this.role,
    this.id,
    this.v,
  });

  NewUserData.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'] as String?;
    email = json['email'] as String?;
    password = json['password'] as String?;
    phone = json['phone'] as String?;
    role = json['role'] as String?;
    id = json['_id'] as String?;
    v = json['__v'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['fullname'] = fullname;
    json['email'] = email;
    json['password'] = password;
    json['phone'] = phone;
    json['role'] = role;
    json['_id'] = id;
    json['__v'] = v;
    return json;
  }
}
