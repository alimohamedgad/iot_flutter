part of 'create_project_cubit.dart';

@immutable
sealed class CreateProjectState {}

final class CreateProjectInitial extends CreateProjectState {}

final class CreateProjectLoading extends CreateProjectState {}

final class CreateProjectSuccess extends CreateProjectState {}

final class CreateProjectError extends CreateProjectState {}

final class GetProjectLoading extends CreateProjectState {}

final class GetProjectSuccess extends CreateProjectState {}

final class GetProjectError extends CreateProjectState {}

final class UpdateRoomState extends CreateProjectState {}
