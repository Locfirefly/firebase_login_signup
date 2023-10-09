import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../repository/user_repo.dart';

part 'forgot_password_even.dart';
part 'forgot_password_state.dart';

class ChangeBloc extends Bloc<ChangeEvent,ChangeState>{
  final UserRepository _userRepository;
  ChangeBloc({
    required UserRepository userRepository
  }) : _userRepository = userRepository,
        super(ResetInitial()){
    on<ResetPassword>((event, emit) async {
      emit(ResetProcess());
      try{
        _userRepository.resetPassword(
            event.email,
        );
        emit(ResetSuccess());
      }
      catch (e){
        log(e.toString());
        emit(const ResetFailure());
      }
    });
  }

}