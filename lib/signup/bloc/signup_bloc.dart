import 'package:equatable/equatable.dart';
import 'package:firebase_login_signup/repository/user.dart';
import 'package:firebase_login_signup/repository/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'signup_even.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEven,SignUpState> {
  final UserRepository _userRepository;

  SignUpBloc ({
    required UserRepository userRepository
  }) : _userRepository = userRepository,
        super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) async{
      emit(SignUpProcess());
      try{
        MyUser user = await _userRepository.signUp(event.user, event.password);
        await _userRepository.setUserData(user);
        emit(SignUpSuccess());
      }
      catch (e){
        emit(SignUpFailure());
      }
    });
  }
}