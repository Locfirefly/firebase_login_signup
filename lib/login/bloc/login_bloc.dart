import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../repository/user_repo.dart';

part 'login_state.dart';
part 'login_even.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  final UserRepository _userRepository;

  LoginBloc({
    required UserRepository userRepository
  }) : _userRepository = userRepository,
        super(LoginInitial()){
    on<LoginRequired>((event, emit) async {
      emit(LoginProcess());
      try{
        await _userRepository.login(event.email, event.password);
        emit(LoginSuccess());
      }
      catch (e){
        log(e.toString());
        emit(const LoginFailure());
      }
    });
    on<LogoutRequired>((event, emit) async {
      await _userRepository.logOut();
    });
  }
}
