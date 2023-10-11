import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_signup/firebase_auth/auth_bloc.dart';
import 'package:firebase_login_signup/repository/user_repo.dart';
import 'package:firebase_login_signup/signup/bloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/size.dart';
import 'bloc/login_bloc.dart';
class Login extends StatefulWidget {
  final UserRepository userRepository;
  const Login(this.userRepository,{super.key});

  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login>  {
  final _formKey = GlobalKey<FormState>();
  final firebaseUser = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;
  bool signInRequire = false;

  void cleartext(){
    emailController.clear();
    passController.clear();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocListener<LoginBloc,LoginState>(
      listener: (context, state) {
        if(state is LoginSuccess) {
          setState(() {
            signInRequire = false;
          });
          if(firebaseUser.currentUser!.emailVerified == true){
            autologin();
            Navigator.of(context).pushReplacementNamed('navbar');
          }
          else{
            Navigator.pushNamed(context, 'verify');
          }
          }
        else{
          if(state is LoginProcess){
            setState(() {
              signInRequire = true;
            });
          }
          else{
            if( state is LoginFailure){
              setState(() {
                signInRequire = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Center(
                          child: Text('Invalid email or password'))
                  )
              );
            }
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title:const Text('Sign In',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.screenHeight * 0.04),
                        Center(
                          child: Text('Welcome back',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: getProportionateScreenWidth(28),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Center(
                          child: Text('Sign in with your email and password  \nor continue with social media',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.08,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            maxLength: 30,
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: const TextStyle(
                                fontSize: 20,
                              ),
                              counterText: '',
                              hintText: "Enter your email",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              suffixIcon: const Icon(Icons.mail_outline_rounded),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Color(0xfff77546),
                                ),
                              ),
                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Email is require';
                              }
                              if(!RegExp(
                                  r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
                                  .hasMatch(value)){
                                return 'please enter valid email';
                              }
                              return null;
                            },
                            controller: emailController,
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            maxLength: 30,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: const TextStyle(
                                fontSize: 20,
                              ),
                              counterText: '',
                              hintText: "Enter your password",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              suffixIcon: const Icon(Icons.lock_outline_rounded),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Color(0xfff77546),
                                ),
                              ),
                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Password is require';
                              }
                              if(!RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                  .hasMatch(value)){
                                return 'please enter valid password';
                              }
                              return null;
                            },
                            controller: passController,
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(20)),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'finds');
                              },
                              child: const Text('Forgot password',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            ],
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        GestureDetector(
                          onTap: () async {
                            if(_formKey.currentState!.validate()){
                              try {
                                context.read<LoginBloc>().add(LoginRequired(
                                    emailController.text,
                                    passController.text)
                                );
                              }
                              on FirebaseAuthException catch (e) {
                                showDialog(
                                    context: context,
                                    builder: (context){
                                      return AlertDialog(
                                        content: Text(e.toString(),
                                        ),
                                      );
                                    }
                                );
                              }
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 300,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xfff77546),
                            ),
                            child: const Text('Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: getProportionateScreenWidth(40),
                              height: getProportionateScreenWidth(40),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFB0B0B0).withOpacity(0.2),
                              ),
                              child: const Center(
                                  child: FaIcon(FontAwesomeIcons.github,
                                  color: Colors.grey,
                                  )
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: getProportionateScreenWidth(40),
                              height: getProportionateScreenWidth(40),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFB0B0B0).withOpacity(0.2),
                              ),
                              child: const Center(
                                  child: FaIcon(FontAwesomeIcons.facebook,
                                    color: Colors.grey,
                                  ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: getProportionateScreenWidth(40),
                              height: getProportionateScreenWidth(40),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFB0B0B0).withOpacity(0.2),
                              ),
                              child: const Center(
                                  child: FaIcon(FontAwesomeIcons.twitter,
                                    color: Colors.grey,
                                  ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don’t have an account?',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 5, height: 5),
                            BlocProvider<SignUpBloc>(
                              create: (context) => SignUpBloc(
                                  userRepository: context.read<AuthBloc>().userRepository
                              ),
                              child:  GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, 'signup');
                                },
                                child: const Text('Sign Up',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xfff77546)
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
  Future<void> autologin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email', firebaseUser.currentUser!.email.toString());
  }
}

