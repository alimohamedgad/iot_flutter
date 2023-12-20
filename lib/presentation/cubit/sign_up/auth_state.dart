abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoading extends AuthState {}

final class SignUpSuceess extends AuthState {}

final class SignUpError extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuceess extends AuthState {}

final class LoginError extends AuthState {}
