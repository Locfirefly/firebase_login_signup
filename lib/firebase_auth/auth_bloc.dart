import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import '../repository/user_repo.dart';

part 'auth_even.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;
  late final StreamSubscription<User?> _userSubscription;


  AuthBloc({
    required UserRepository myUserRepository
  }) : userRepository = myUserRepository,
        super(const AuthState.unknown()) {
    _userSubscription = userRepository.user.listen((authUser) {
      add(AuthenticationUserChanged(authUser));
    });
    on<AuthenticationUserChanged>((event, emit) {
        if(event.user != null){
          emit(AuthState.authenticated(event.user!));
        }
        else{
          emit(const AuthState.unauthenticated());
        }
    });
  }
  @override
  Future<void> close(){
    _userSubscription.cancel();
    return super.close();
  }
}