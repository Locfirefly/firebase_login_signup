import 'package:firebase_login_signup/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/size.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    BlocProvider.of<SplashBloc>(context).add(SetSplash());
    return BlocListener<SplashBloc,SplashState>(
      listener: (context,  state) {
        if (state is SplashLoaded) {
          Navigator.of(context).pushReplacementNamed('home');
        }
        else{
          if(state is SplashFailure){
            Navigator.of(context).pushReplacementNamed('login');
          }
        }
      },
      child: Scaffold(
            body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Lottie.asset('assets/gif/animation.json',
                          width: 400,
                          height: 400,
                        ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.25,),
                    const Text('From',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const Text('Firefly with love',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15
                      ),
                    ),
                  ],
                )
            )
          ),
    );
}
}
