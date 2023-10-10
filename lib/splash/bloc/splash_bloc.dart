import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'splash_even.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEven,SplashState>  {
  SplashBloc() : super(SplashInitial()){
    on<SetSplash>((event, emit) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var email = pref.getString('email');
      if(email != null){
      emit(SplashLoading());
      await Future.delayed(const Duration(seconds: 5));
      emit(SplashLoaded());
      }
      else{
        await Future.delayed(const Duration(seconds: 5));
        emit(SplashFailure());
      }
    });
  }
}

