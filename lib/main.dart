import 'package:firebase_login_signup/login/bloc/login_bloc.dart';
import 'package:firebase_login_signup/repository/firebase_user_repo.dart';
import 'package:firebase_login_signup/firebase_auth/email_verification.dart';
import 'package:firebase_login_signup/signup/bloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer.dart';
import 'forgot_password/forgot_password.dart';
import 'login/login.dart';
import 'signup/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
     MultiBlocProvider(
       providers: [
         BlocProvider<LoginBloc>(
             create: (context) => LoginBloc(userRepository: FirebaseUserRepository()),
         ),
         BlocProvider<SignUpBloc>(
             create: (context) => SignUpBloc(userRepository: FirebaseUserRepository()),
         ),
       ],
       child: MaterialApp(
         debugShowCheckedModeBanner: false,
        home:  Login(FirebaseUserRepository()),
        routes: {
          'login': (BuildContext context) =>  Login(FirebaseUserRepository()),
          'signup': (BuildContext context) => const SignUp(),
          'finds': (BuildContext context) => const ForgotPassword(),
          'verify': (BuildContext context) => const Verification(),
          //'success': (BuildContext context) => const LoginSuccess(),
        },
    ),
     )
  );
}

