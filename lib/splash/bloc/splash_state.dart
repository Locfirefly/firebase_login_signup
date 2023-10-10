part of 'splash_bloc.dart';

abstract class SplashState extends Equatable{
  const SplashState();
  @override
  List<Object> get props => [];
}
class SplashInitial extends SplashState {}
class SplashLoading extends SplashState {}
class SplashLoaded extends SplashState {}
class SplashFailure extends SplashState {}