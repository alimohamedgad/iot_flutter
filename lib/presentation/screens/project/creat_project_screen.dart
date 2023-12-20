// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:untitled6/data/model/signup_model.dart';
// import 'package:untitled6/presentation/cubit/create_project/create_project_cubit.dart';
// import 'package:untitled6/presentation/screens/sensors/create_sensor.dart';

// import '../../widgets/text_form_field.dart';
// import 'widget/custom_drop_down.dart';

// class CreateProjectScreen extends StatefulWidget {
//   final AuthModel? authModel;
//   const CreateProjectScreen({
//     Key? key,
//     this.authModel,
//   }) : super(key: key);

//   @override
//   State<CreateProjectScreen> createState() => _CreateProjectScreenState();
// }

// class _CreateProjectScreenState extends State<CreateProjectScreen> {
//   TextEditingController projectNameController = TextEditingController();
//   TextEditingController projectTypecontroller = TextEditingController();
//   TextEditingController floorController = TextEditingController();
//   TextEditingController roomsController = TextEditingController();

//   List<String> projectTypList = ['Hotel', 'Home', "Villa", 'Company'];
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CreateProjectCubit, CreateProjectState>(
//       builder: (context, state) {
//         final createProject = context.read<CreateProjectCubit>();
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text('Create Prject'),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
//             child: Column(
//               children: [
//                 CustomTextField(
//                   hintText: 'Project Name',
//                   controller: projectNameController,
//                 ),
//                 const SizedBox(height: 10),
//                 CustomDropDown(
//                   item: projectTypList
//                       .map((e) => DropdownMenuItem(
//                             value: e,
//                             child: Text(e),
//                           ))
//                       .toList(),
//                   onChange: (v) {
//                     createProject.projectType = v.toString();
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 createProject.projectType == "Villa"
//                     ? CustomTextField(
//                         hintText: 'How many floors?',
//                         controller: floorController,
//                       )
//                     : const SizedBox.shrink(),
//                 const SizedBox(height: 10),
//                 createProject.projectType == "Home" ||
//                         createProject.projectType == "Villa"
//                     ? CustomTextField(
//                         hintText: 'How many rooms?',
//                         controller: roomsController,
//                       )
//                     : const SizedBox.shrink(),
//                 const SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {});
//                     // createProject.createProject(
//                     //   ownerId: widget.authModel!.id!,
//                     //   projectType: projectType,
//                     //   projectName: projectNamecontroller.text,
//                     // );
//                   },
//                   child: state is CreateProjectLoading
//                       ? const CircularProgressIndicator()
//                       : const Text('Create Project'),
//                 ),
//                 // ElevatedButton(
//                 //   onPressed: () {
//                 //     print(projectType);
//                 //     Navigator.push(
//                 //       context,
//                 //       MaterialPageRoute(
//                 //         builder: (context) {
//                 //           return CreateSensorScreen(
//                 //             createProjectModel:
//                 //                 createProject.createProjectModel,
//                 //           );
//                 //         },
//                 //       ),
//                 //     );
//                 //   },
//                 //   child: const Text('Get All Project'),
//                 // ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
