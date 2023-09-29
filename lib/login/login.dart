import 'package:firebase_login_signup/repository/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/size.dart';
class Login extends StatefulWidget {
  final UserRepository userRepository;
  const Login(this.userRepository,{super.key});

  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  void cleartext(){
    emailController.clear();
    passController.clear();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
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
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    maxLength: 30,
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
                Container(
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
                          child: FaIcon(FontAwesomeIcons.google)
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
                          child: FaIcon(FontAwesomeIcons.facebook)
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
                          child: FaIcon(FontAwesomeIcons.twitter)
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
          )
      ),
    );
  }

}
