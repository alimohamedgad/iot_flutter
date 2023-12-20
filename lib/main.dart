import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled6/core/constant/color_manager.dart';
import 'package:untitled6/core/mqtt_helper/mqtt_manager.dart';
import 'package:untitled6/presentation/cubit/sign_up/auth_cubit.dart';
import 'package:untitled6/presentation/screens/Spash.dart';
import 'package:untitled6/presentation/screens/create_rooms/create_room.dart';
import 'package:untitled6/presentation/screens/home/home-screen.dart';
import 'package:untitled6/presentation/screens/root_screen.dart';
import 'package:untitled6/presentation/screens/vertical%20box.dart';
import 'package:untitled6/presentation/widgets/anlytics_list.dart';

import 'core/utils/api_services.dart';
import 'presentation/cubit/create_project/create_project_cubit.dart';
import 'presentation/screens/auth/login_screen.dart';
import 'presentation/screens/living_room/living_room.dart';

late SharedPreferences sharedPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MQTTManager(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CreateProjectCubit(ApiService(Dio())),
          ),
          BlocProvider(
            create: (context) => AuthCubit(ApiService(Dio())),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Barlow'),
          home: sharedPref.getString('id') != null
              ? const LoginScreen()
              : RootScreen(),
        ),
      ),
    );
  }
}
