// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
// import 'package:toast/toast.dart';
import 'package:untitled6/core/utils/api_constants.dart';

import 'package:untitled6/core/utils/api_services.dart';
import 'package:untitled6/data/model/create_project_model.dart';

part 'create_project_state.dart';

class CreateProjectCubit extends Cubit<CreateProjectState> {
  final ApiService apiService;
  CreateProjectCubit(
    this.apiService,
  ) : super(CreateProjectInitial());
  CreateProjectModel? createProjectModel;
  String projectType = '';
  bool isRoom = false;
  bool isVilla = false;

  updateProjectState(bool state) {
    state = !state;
    emit(UpdateRoomState());
  }

  createProject({
    String? projectName,
    String? projectType,
    String? ownerId,
  }) {
    emit(CreateProjectLoading());
    Dio().post(
      "https://iot-platform.onrender.com/api/projects",
      queryParameters: {'Content-Type': 'application/json'},
      data: {
        "owner": ownerId,
        "project_type": projectType,
        "name": projectName
      },
    ).then((value) {
      print(value.data);
      if (value.statusCode == 201) {
        createProjectModel = CreateProjectModel.fromMap(value.data['data']);
        emit(CreateProjectSuccess());
      }
      if (value.statusCode == 400) {
        // Toast.show('This name is Exiest Before', gravity: Toast.center);
        Fluttertoast.showToast(
          msg: 'This name is Exiest Before',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.red,
          fontSize: 16.0,
        );

        emit(CreateProjectSuccess());
      }
    }).catchError((e) {
      log(e.toString());
      emit(CreateProjectError());
    });
  }

  createUserToProject({
    String? ownerId,
    String? fullName,
    String? email,
    String? password,
    String? phone,
    String? projectID,
  }) {
    Dio().post(
      "https://iot-platform.onrender.com/api/users/$ownerId",
      queryParameters: {'Content-Type': 'application/json'},
      data: {
        "fullname": "saad",
        "email": "saad@gmail.com",
        "password": "123456",
        "phone": "0115684894",
        "projectId": "65763600144cef79563117df"
      },
    ).then((value) {
      print(value.data['data']);
      if (value.statusCode == 200) {
        createProjectModel =
            CreateProjectModel.fromMap(value.data['projectData']);
      }
      emit(CreateProjectSuccess());
    }).catchError((e) {
      log(e.toString());
    });
  }

  List<CreateProjectModel> userProjectList = [];
  getAllProject({
    String? ownerId,
  }) {
    emit(GetProjectLoading());
    Dio().get(
      "https://iot-platform.onrender.com/api/users/$ownerId/projects?",
      queryParameters: {'Content-Type': 'application/json'},
    ).then((response) {
      if (response.statusCode == 200) {
        userProjectList = (response.data as List)
            .map((e) => CreateProjectModel.fromMap(e))
            .toList();
      }
      emit(GetProjectSuccess());
    }).catchError((e) {
      print(e.toString());
      emit(GetProjectSuccess());
    });
  }

  createSensor({
    required String projectID,
    required String description,
  }) {
    Dio().post('https://iot-platform.onrender.com/api/sensors/createSenssor',
        queryParameters: {
          'Content-Type': 'application/json'
        },
        data: {
          "projectId": projectID,
          "jop_description": description
        }).then((response) {
      print(response.data);
    }).catchError((e) {
      print(e.toString());
    });
  }

  // getAllUserOfProject({
  //   required Object data,
  // }) {
  //   apiService
  //       .get(endPoint: getAllUserOFProjectEndPoint)
  //       .then((value) {})
  //       .catchError((e) {});
  // }

  // getOwnerProject({
  //   required Object data,
  // }) {
  //   apiService
  //       .get(endPoint: getOwnerProjectEndPoint)
  //       .then((value) {})
  //       .catchError((e) {});
  // }
}
