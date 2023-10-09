part of 'forgot_password_bloc.dart';

abstract class ChangeEvent extends Equatable{
  const ChangeEvent();
  @override
  List<Object> get props => [];
}

class ResetPassword extends ChangeEvent{
  final String email;
  const ResetPassword(this.email);
}