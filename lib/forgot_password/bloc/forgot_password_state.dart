part of 'forgot_password_bloc.dart';

@immutable
abstract class ChangeState extends Equatable {
  const ChangeState();

  @override
  List<Object> get props => [];
}
class ResetInitial extends ChangeState {}
class ResetSuccess extends ChangeState {}
class ResetFailure extends ChangeState {
  final String? message;
  const ResetFailure({this.message});
}
class ResetProcess extends ChangeState{}