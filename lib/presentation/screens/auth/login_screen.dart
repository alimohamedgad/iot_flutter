import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/core/utils/api_services.dart';
import 'package:untitled6/data/model/signup_model.dart';
import 'package:untitled6/main.dart';
import 'package:untitled6/presentation/cubit/sign_up/auth_cubit.dart';
import 'package:untitled6/presentation/cubit/sign_up/auth_state.dart';
import 'package:untitled6/presentation/screens/project/creat_project_screen.dart';
import 'package:untitled6/presentation/screens/sensors/create_sensor.dart';
import 'package:untitled6/presentation/widgets/text_form_field.dart';

import '../create_rooms/create_room.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController =
      TextEditingController(text: 'sasa1@gmail.com');
  final TextEditingController passwordController =
      TextEditingController(text: 'aliGad2580@');
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        final signCubit = context.read<AuthCubit>();

        if (state is LoginSuceess) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return CreateRoomScreen(
                authModel: signCubit.authModel,
              );
            },
          ), (route) => false);
          sharedPref.setString('id', signCubit.authModel!.id!);
          print(signCubit.authModel?.id);
          print(signCubit.authModel?.email);
          print(signCubit.authModel?.name);
          print(signCubit.authModel?.phone);
          print(signCubit.authModel?.token);
        }
      },
      builder: (context, state) {
        final signCubit = context.read<AuthCubit>();
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  CustomTextField(
                    hintText: 'Enter Your Email',
                    controller: emailController,
                  ),
                  CustomTextField(
                    hintText: 'Enter Your Password',
                    controller: passwordController,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(250, 40),
                    ),
                    onPressed: () async {
                      await signCubit.login(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    },
                    child: state is LoginLoading
                        ? const CircularProgressIndicator()
                        : const Text('Login'),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
