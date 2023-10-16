import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_signup/repository/model/user.dart';
import 'package:firebase_login_signup/signup/bloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/size.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final repassController = TextEditingController();
  final firebaseUser = FirebaseAuth.instance;
  bool signupRequire = false;

  void cleartext(){
    emailController.clear();
    passController.clear();
    repassController.clear();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocListener<SignUpBloc,SignUpState>(
      listener: (context, state) {
        if(state is SignUpSuccess){
          setState(() {
            signupRequire = false;
          });
          Navigator.of(context).pushReplacementNamed('login');
          cleartext();
          const SnackBar(
              content: Center(
                  child: Text('Sign In success'))
          );

        }
        else{
          if(state is SignUpProcess){
            setState(() {
              signupRequire = true;
            });
          }
          else{
            if(state is SignUpFailure){
              setState(() {
                signupRequire = false;
              });
              const SnackBar(
                  content: Center(
                      child: Text('Email already in use'))
              );
              return;
            }
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title:const Text('Sign Up',
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
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Center(
                    child: Text('Register Account',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(28),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text('Complete your details or continue \nwith social media',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.07,),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
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
                        SizedBox(height: getProportionateScreenHeight(30)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            maxLength: 30,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              labelStyle: const TextStyle(
                                fontSize: 20,
                              ),
                              counterText: '',
                              hintText: "Re-enter your password",
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
                              if (value!.isEmpty){
                                return 'Re-password is require';
                              }
                              if (value != passController.text){
                                return 'The passwords do not match';
                              }
                              return null;
                            },
                            controller: repassController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(40)),
                  GestureDetector(
                    onTap: (){
                      if(_formKey.currentState!.validate()){
                        MyUser myUser = MyUser.empty;
                        myUser = myUser.copyWith(
                          email: emailController.text,
                          name: firebaseUser.currentUser!.displayName,
                        );
                        setState(() {
                          context.read<SignUpBloc>().add(
                              SignUpRequired(
                                myUser,
                                passController.text,
                              )
                          );
                        });

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
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
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
                  const SizedBox(height: 5),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('By continuing your confirm that you agree \nwith our Term and Condition',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}
