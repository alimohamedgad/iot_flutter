import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/presentation/cubit/create_project/create_project_cubit.dart';
import 'package:untitled6/presentation/cubit/sign_up/auth_cubit.dart';

class GetUserProject extends StatefulWidget {
  const GetUserProject({super.key});

  @override
  State<GetUserProject> createState() => _GetUserProjectState();
}

class _GetUserProjectState extends State<GetUserProject> {
  @override
  void initState() {
    context
        .read<CreateProjectCubit>()
        .getAllProject(ownerId: context.read<AuthCubit>().authModel!.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CreateProjectCubit, CreateProjectState>(
        builder: (context, state) {
          final projectCubit = context.read<CreateProjectCubit>();
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: projectCubit.userProjectList.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child:
                          Text(projectCubit.userProjectList[index].projectTyp),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
