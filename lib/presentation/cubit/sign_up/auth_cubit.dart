// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:untitled6/core/utils/api_services.dart';
import 'package:untitled6/data/model/signup_model.dart';

import '../../../core/utils/api_constants.dart';
import '../../screens/project/creat_project_screen.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final ApiService apiService;
  AuthCubit(this.apiService) : super(AuthInitial());
  AuthModel? signUpModel;
  signUp(AuthModel signUpModel) {
    apiService
        .post(
      endPoint: 'users/',
      data: signUpModel.toMap(),
    )
        .then((value) {
      log(value.data);
      // signUpModel = value.data;
    }).catchError((e) {
      log(e.toString());
    });
  }

  AuthModel? authModel;
  login({required String email, required String password}) {
    emit(LoginLoading());
    Dio().post('${baseUrl}users/login', data: {
      'email': email,
      'password': password,
    }).then((value) {
      if (value.statusCode == 200) {
        authModel = AuthModel(
          email: value.data['email'],
          name: value.data['fullname'],
          phone: value.data['phone'],
          id: value.data['_id'],
          token: value.data['token'],
        );
      }
      emit(LoginSuceess());
    }).catchError((e) {
      log(e.toString());
      emit(LoginError());
    });
  }
}
