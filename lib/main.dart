import 'package:firebase_login_signup/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:firebase_login_signup/home/home.dart';
import 'package:firebase_login_signup/login/bloc/login_bloc.dart';
import 'package:firebase_login_signup/repository/firebase_user_repo.dart';
import 'package:firebase_login_signup/signup/bloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc_observer.dart';
import 'firebase_auth/email_verification.dart';
import 'forgot_password/forgot_password.dart';
import 'login/login.dart';
import 'signup/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SharedPreferences pref = await SharedPreferences.getInstance();
  var email = pref.getString('email');
  runApp(
     MultiBlocProvider(
       providers: [
         BlocProvider<ChangeBloc>(
           create: (context) => ChangeBloc(userRepository: FirebaseUserRepository()),
         ),
         BlocProvider<LoginBloc>(
             create: (context) => LoginBloc(userRepository: FirebaseUserRepository()),
         ),
         BlocProvider<SignUpBloc>(
             create: (context) => SignUpBloc(userRepository: FirebaseUserRepository()),
         ),
       ],
       child: MaterialApp(
         debugShowCheckedModeBanner: false,
        home:  email == null ? Login(FirebaseUserRepository()) : const Home() ,
        routes: {
          'login': (BuildContext context) =>  Login(FirebaseUserRepository()),
          'signup': (BuildContext context) => const SignUp(),
          'finds': (BuildContext context) => const ForgotPassword(),
          'verify': (BuildContext context) => const Verification(),
          'home': (BuildContext context) => const Home(),
        },
    ),
     )
  );
}

