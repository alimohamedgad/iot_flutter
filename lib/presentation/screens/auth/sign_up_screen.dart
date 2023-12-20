import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/core/utils/api_services.dart';
import 'package:untitled6/data/model/signup_model.dart';
import 'package:untitled6/presentation/cubit/sign_up/auth_cubit.dart';
import 'package:untitled6/presentation/widgets/text_form_field.dart';

import '../../cubit/sign_up/auth_state.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final signCubit = context.read<AuthCubit>();
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  CustomTextField(
                    hintText: 'Enter Your Name',
                    controller: nameController,
                  ),
                  CustomTextField(
                    hintText: 'Enter Your Email',
                    controller: emailController,
                  ),
                  CustomTextField(
                    hintText: 'Enter Your Phone',
                    controller: phoneController,
                  ),
                  CustomTextField(
                    hintText: 'Enter Your Password',
                    controller: passwordController,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await signCubit.signUp(
                        AuthModel(
                          email: emailController.text,
                          password: passwordController.text,
                          name: nameController.text,
                          phone: phoneController.text,
                        ),
                      );
                    },
                    child: const Text('SignUp'),
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
