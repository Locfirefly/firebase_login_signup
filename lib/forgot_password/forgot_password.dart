import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_signup/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/size.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final firebaseUser = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  bool resetPassword = false;
  void cleartext(){
    emailController.clear();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocListener<ChangeBloc,ChangeState>(
      listener: (BuildContext context, ChangeState state) {
        if(state is ResetSuccess) {
          setState(() {
            resetPassword = false;
          });
          Navigator.of(context).pushReplacementNamed('login');
        }
        else{
          if(state is ResetProcess){
            setState(() {
              resetPassword = true;
            });
          }
          else{
            if( state is ResetFailure){
              setState(() {
                resetPassword = false;
              });
            }
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:const Text('Forgot Password',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Center(
                  child: Text('Forgot Password',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Center(
                  child: Text('Please enter your email and we will send \nyou a link to return to your account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.15),
                Form(
                  key: _formKey,
                  child: Padding(
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
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.2),
                GestureDetector(
                  onTap: (){
                    if(_formKey.currentState!.validate()) {
                      try {
                        context.read<ChangeBloc>().add(ResetPassword(
                          emailController.text,
                        ));
                        cleartext();
                      }
                      on FirebaseAuthException catch (e) {
                        if(e.code.toString() == 'user-not-found'){
                          const AlertDialog(
                            title: Text('Alert'),
                            content: Text('Email not found'),
                          );
                        }
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
                SizedBox(height: SizeConfig.screenHeight * 0.1),
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
                    GestureDetector(
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
