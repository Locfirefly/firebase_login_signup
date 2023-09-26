part of 'signup_bloc.dart';

abstract class SignUpEven extends Equatable{
  const SignUpEven();
  List<Object> get props => [];
}
class SignUpRequired extends SignUpEven{
  final MyUser user;
  final String password;
  const SignUpRequired(this.user,this.password);
}