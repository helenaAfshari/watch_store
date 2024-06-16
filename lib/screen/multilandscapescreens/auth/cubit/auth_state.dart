part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class LoadingState extends AuthState {}
final class ErrorState extends AuthState {}
final class SendState extends AuthState {
  final mobile;
  SendState({required this.mobile});
}
final class VerifiedState extends AuthState {}
final class VerifiedIsRegistredState extends AuthState {}
final class VerifiedNotRegistredState extends AuthState {}
final class LoggedInState extends AuthState {}
final class LoggedOutState extends AuthState {}
