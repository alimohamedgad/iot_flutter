// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/data/model/create_project_model.dart';

import 'package:untitled6/data/model/signup_model.dart';
import 'package:untitled6/presentation/cubit/create_project/create_project_cubit.dart';

import '../../widgets/text_form_field.dart';

class CreateSensorScreen extends StatefulWidget {
  final CreateProjectModel? createProjectModel;
  const CreateSensorScreen({
    Key? key,
    this.createProjectModel,
  }) : super(key: key);

  @override
  State<CreateSensorScreen> createState() => _CreateSensorScreenState();
}

class _CreateSensorScreenState extends State<CreateSensorScreen> {
  TextEditingController descriptionNamecontroller = TextEditingController();
  TextEditingController projectTypecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateProjectCubit, CreateProjectState>(
      builder: (context, state) {
        final createProject = context.read<CreateProjectCubit>();
        return Scaffold(
          appBar: AppBar(
            title: const Text('Create Sensor'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Column(
              children: [
                CustomTextField(
                  hintText: 'Description',
                  controller: descriptionNamecontroller,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    createProject.createSensor(
                      projectID: widget.createProjectModel!.projectId!,
                      description: descriptionNamecontroller.text,
                    );
                  },
                  child: state is CreateProjectLoading
                      ? const CircularProgressIndicator()
                      : const Text('Create Sensor'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
