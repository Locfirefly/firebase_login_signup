import 'package:firebase_login_signup/repository/firebase_user_repo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer.dart';
import 'login/login.dart';
import 'signup/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
     MaterialApp(
       debugShowCheckedModeBanner: false,
      home: Login(FirebaseUserRepository()),
      routes: {
        'login': (BuildContext context) =>  Login(FirebaseUserRepository()),
        'signup': (BuildContext context) => const SignUp(),
      },
    )
  );
}

